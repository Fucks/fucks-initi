'use strict';

function CronogramaController($injector, $scope, cronogramaService) {

    /**
     * Inject methods, attributes and states inherited of the AbstractCRUDController 
     * @see AbstractCRUDController
     */
    $injector.invoke(AbstractController, this, {$scope: $scope});

    //States

    //Vars
    $scope.error;
    $scope.confirmPassword;
    $scope.ge;  //this is the hugly but very friendly global var for the gantt editor
    $scope.showResourceContent;
    $scope.projectResources = [];
    $scope.resource = {};
    $scope.currentProject;

    /**
     * 
     * @param {type} toState
     * @param {type} toParams
     * @returns {undefined}
     */
    $scope.init = function (toState, toParams) {
        $scope.currentState = toState.name;
        $scope.showResourceContent = false;

        //load templates
        $("#ganttemplates").loadTemplates();

        // here starts gantt initialization
        $scope.ge = new GanttMaster();
        var workSpace = $("#workSpace");
        var resContent = $("#resourcesContent");
        workSpace.css({height: ($(window).height() * 75) / 100});
        resContent.css({height: ($(window).height() * 75) / 100});
        $scope.ge.init(workSpace);

        //overwrite with localized ones
        $scope.loadI18n();

        //simulate a data load from a server.
        $scope.loadGanttFromServer(toParams.id);


        //fill default Teamwork roles if any
        if (!$scope.ge.roles || $scope.ge.roles.length == 0) {
            $scope.setRoles();
        }

        //fill default Resources roles if any
        if (!$scope.ge.resources || $scope.ge.resources.length == 0) {
            $scope.setResource();
        }


        /*/debug time scale
         $(".splitBox2").mousemove(function(e){
         var x=e.clientX-$(this).offset().left;
         var mill=Math.round(x/(ge.gantt.fx) + ge.gantt.startMillis)
         $("#ndo").html(x+" "+new Date(mill))
         });*/

        $(window).resize(function () {
            workSpace.trigger("resize.gantt");
        }).oneTime(150, "resize", function () {
            $(this).trigger("resize");
        });
    };
    
    $scope.loadGanttFromServer = function (id) {
        cronogramaService.findProject(id)
                .then(function (response) {
                    $scope.currentProject = response;

                    $scope.projectResources = $scope.currentProject.resources;

                    //this is the real implementation
                    //var taskId = $("#taskSelector").val();
                    $scope.ge.loadProject($scope.currentProject);
                    $scope.ge.checkpoint(); //empty the undo stack    
                });
    };

    $scope.saveGanttOnServer = function () {
        if (!$scope.currentProject.canWrite)
            return;

        //obtem todas as atividades para salvar o projeto
        $scope.currentProject.tasks = $scope.ge.saveGantt().tasks;

        //necessário limpar os IDs
        $scope.currentProject.tasks.forEach(function (task){
            if((task.id + "").indexOf("tmp_") == 0){
                task.id = null;
            }
            task.projectIndex = $scope.currentProject.tasks.indexOf(task);
        });

        cronogramaService.updateProject($scope.currentProject)
                .then(function (response) {
                    response = JSON.parse(response);
                    Materialize.toast(response.msg, 5000);
                });
    };


//---- GANT ANGULAR EVENTS ------/
    $scope.showCriticalPath = function () {
        $scope.ge.gantt.showCriticalPath = !$scope.ge.gantt.showCriticalPath;
        $scope.ge.redraw();
    };



//----------------------------------------------- GANT METODS ----------------------------------------------------------/


    //-------------------------------------------  Create some demo data ------------------------------------------------------
    $scope.setRoles = function () {
        $scope.ge.roles = [
            {
                id: "tmp_1",
                name: "Project Manager"
            },
            {
                id: "tmp_2",
                name: "Worker"
            },
            {
                id: "tmp_3",
                name: "Stakeholder/Customer"
            }
        ];
    }

    $scope.setResource = function () {
        var res = [];
        for (var i = 1; i <= 10; i++) {
            res.push({id: "tmp_" + i, name: "Resource " + i});
        }
        $scope.ge.resources = res;
    }


    $scope.editResources = function () {

    }

    $scope.clearGantt = function () {
        $scope.ge.reset();
    }

    $scope.loadI18n = function () {
        GanttMaster.messages = {
            "CANNOT_WRITE": "CANNOT_WRITE",
            "CHANGE_OUT_OF_SCOPE": "NO_RIGHTS_FOR_UPDATE_PARENTS_OUT_OF_EDITOR_SCOPE",
            "START_IS_MILESTONE": "START_IS_MILESTONE",
            "END_IS_MILESTONE": "END_IS_MILESTONE",
            "TASK_HAS_CONSTRAINTS": "TASK_HAS_CONSTRAINTS",
            "GANTT_ERROR_DEPENDS_ON_OPEN_TASK": "GANTT_ERROR_DEPENDS_ON_OPEN_TASK",
            "GANTT_ERROR_DESCENDANT_OF_CLOSED_TASK": "GANTT_ERROR_DESCENDANT_OF_CLOSED_TASK",
            "TASK_HAS_EXTERNAL_DEPS": "TASK_HAS_EXTERNAL_DEPS",
            "GANTT_ERROR_LOADING_DATA_TASK_REMOVED": "GANTT_ERROR_LOADING_DATA_TASK_REMOVED",
            "ERROR_SETTING_DATES": "ERROR_SETTING_DATES",
            "CIRCULAR_REFERENCE": "CIRCULAR_REFERENCE",
            "CANNOT_DEPENDS_ON_ANCESTORS": "CANNOT_DEPENDS_ON_ANCESTORS",
            "CANNOT_DEPENDS_ON_DESCENDANTS": "CANNOT_DEPENDS_ON_DESCENDANTS",
            "INVALID_DATE_FORMAT": "INVALID_DATE_FORMAT",
            "TASK_MOVE_INCONSISTENT_LEVEL": "TASK_MOVE_INCONSISTENT_LEVEL",
            "GANTT_QUARTER_SHORT": "trim.",
            "GANTT_SEMESTER_SHORT": "sem."
        };
    }



    //-------------------------------------------  Get project file as JSON (used for migrate project from gantt to Teamwork) ------------------------------------------------------
    $scope.getFile = function () {
        $("#gimBaPrj").val(JSON.stringify(ge.saveProject()));
        $("#gimmeBack").submit();
        $("#gimBaPrj").val("");

        /*  var uriContent = "data:text/html;charset=utf-8," + encodeURIComponent(JSON.stringify(prj));
         neww=window.open(uriContent,"dl");*/
    }


    //-------------------------------------------  Open a black popup for managing resources. This is only an axample of implementation (usually resources come from server) ------------------------------------------------------

    /**
     * 
     * @returns {undefined}
     */
    $scope.viewResources = function () {
        $scope.showResourceContent = !$scope.showResourceContent;
    };

    /**
     * 
     * @returns {undefined}
     */
    $scope.addResourceInProject = function (resource) {
        $scope.projectResources.push(new Resource(resource.id, resource.name, resource.occupation, resource.profile));

        //coloca a lista de recursos do gantt como a lista de recursos que controlamos.
        $scope.ge.resources = $scope.projectResources;

        $scope.resource = {};
    };
    /**
     * 
     * @returns {undefined}
     */
    $scope.removeResourceInProject = function (resource) {
        $scope.projectResources.splice($scope.projectResources.indexOf(resource), 1);
        $scope.ge.resources = $scope.projectResources;
    };

    $.JST.loadDecorator("ASSIGNMENT_ROW", function (assigTr, taskAssig) {

        var resEl = assigTr.find("[name=resourceId]");
        for (var i in taskAssig.task.master.resources) {
            var res = taskAssig.task.master.resources[i];
            var opt = $("<option>");
            opt.val(res.id).html(res.name);
            if (taskAssig.assig.resourceId == res.id)
                opt.attr("selected", "true");
            resEl.append(opt);
        }


        var roleEl = assigTr.find("[name=roleId]");
        for (var i in taskAssig.task.master.roles) {
            var role = taskAssig.task.master.roles[i];
            var optr = $("<option>");
            optr.val(role.id).html(role.name);
            if (taskAssig.assig.roleId == role.id)
                optr.attr("selected", "true");
            roleEl.append(optr);
        }

        if (taskAssig.task.master.canWrite && taskAssig.task.canWrite) {
            assigTr.find(".delAssig").click(function () {
                var tr = $(this).closest("[assigId]").fadeOut(200, function () {
                    $(this).remove();
                });
            });
        }


    });

}
;