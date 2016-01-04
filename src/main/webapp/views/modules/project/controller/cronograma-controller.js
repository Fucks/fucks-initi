'use strict';

angular.module("Project").controller('CronogramaController', function ($injector, $scope, $mdDialog, $q, cronogramaService, userService) {

    var vm = this;

    $injector.invoke(AbstractController, this, {$scope: $scope});

    //statics
    vm.MIN_HEIGHT_GANTT = 629.25;

    //Vars
    vm.confirmPassword;
    vm.currentProject;
    vm.currentTask = {};
    vm.error;
    vm.ge;  //this is the hugly but very friendly global var for the gantt editor
    vm.projectResources = [];
    vm.resource = {};
    vm.searchText;
    vm.showResourceContent;

    //Methods

    /**GANTT**/
    vm.clearGantt = clearGantt;
    vm.loadGanttFromServer = loadGanttFromServer;
    vm.loadI18n = loadI18n;
    vm.saveGantt = saveGantt;
    vm.showCriticalPath = showCriticalPath;

    /*Resources*/
    vm.addResourceInProject = addResourceInProject;
    vm.editResources = editResources;
    vm.editTask = editTask;
    vm.removeResourceInProject = removeResourceInProject;
    vm.setResource = setResource;
    vm.setRoles = setRoles;
    vm.searchUsers = searchUsers;
    vm.showEditTask = showEditTask;
    vm.viewResources = viewResources;

    /**
     * 
     * @param {type} toState
     * @param {type} toParams
     * @returns {undefined}
     */
    $scope.init = function (toState, toParams) {
        vm.currentState = toState.name;
        vm.showResourceContent = false;

        //load templates
        $("#ganttemplates").loadTemplates();

        // here starts gantt initialization
        vm.ge = new GanttMaster();
        var workSpace = $("#workSpace");
        var resContent = $("#resourcesContent");

        var height = ($(window).height() * 75) / 100 > vm.MIN_HEIGHT_GANTT ? ($(window).height() * 75) / 100 : vm.MIN_HEIGHT_GANTT;

        workSpace.css({height: height});
        resContent.css({height: height});
        vm.ge.init(workSpace);

        //overwrite with localized ones
        vm.loadI18n();

        //simulate a data load from a server.
        vm.loadGanttFromServer(toParams.id);

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


    function showEditTask(ev) {
        $mdDialog.show({
            controller: 'DialogController',
            templateUrl: 'views/modules/project/ui/cronograma/edit-task-dialog-template.jsp',
            parent: angular.element(document.body),
            targetEvent: ev,
            clickOutsideToClose: true,
            fullscreen: false,
            locals: {
                currentTask: vm.currentTask,
                projectResources: vm.projectResources
            }
        })
                .then(function (task) {
                    vm.ge.editor.saveEditTask(task);
                }, function () {
                    console.log('canceled')
                });
    }
    ;

    function searchUsers() {
        if (!vm.searchText) {
            vm.searchText = "";
        }
        userService.showUsersByParams(vm.searchText)
                .then(function (response) {
                    var deferred = $q.defer();
                    deferred.resolve(response.content);
                    return deferred.promise;
                });
    }


    function loadGanttFromServer(id) {
        cronogramaService.findProject(id)
                .then(function (response) {
                    vm.currentProject = response;

//                    vm.projectResources = vm.currentProject.resources;
                    vm.projectResources = new Array();

                    //this is the real implementation
                    //var taskId = $("#taskSelector").val();
                    vm.ge.loadProject(vm.currentProject);
                    vm.ge.checkpoint(); //empty the undo stack    
                });
    }
    ;

    function saveGantt() {
        if (!vm.currentProject.canWrite)
            return;

        //obtem todas as atividades para salvar o projeto
        vm.currentProject.tasks = vm.ge.saveGantt().tasks;

        //necessário limpar os IDs
        vm.currentProject.tasks.forEach(function (task) {
            if ((task.id + "").indexOf("tmp_") == 0) {
                task.id = null;
            }
            task.projectIndex = vm.currentProject.tasks.indexOf(task);
        });

        //verifica os IDs de tasks excluidas para mandar para o servidor
        vm.currentProject.deletedTasksId = vm.ge.deletedTaskIds;

        cronogramaService.updateProject(vm.currentProject)
                .then(function (response) {
                    response = JSON.parse(response);
                    vm.ge.deletedTaskIds = [];
                    $scope.showToast(response.msg, 5000);
                });
    }
    ;

    function showCriticalPath() {
        vm.ge.gantt.showCriticalPath = !vm.ge.gantt.showCriticalPath;
        vm.ge.redraw();
    }
    ;

    function setRoles() {
        vm.ge.roles = [
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

    function setResource() {
        var res = [];
        for (var i = 1; i <= 10; i++) {
            res.push({id: "tmp_" + i, name: "Resource " + i});
        }
        vm.ge.resources = res;
    }

    function editResources() {

    }

    function clearGantt() {
        vm.ge.reset();
    }

    function loadI18n() {
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

    function viewResources() {
        vm.showResourceContent = !vm.showResourceContent;
    }
    ;

    function addResourceInProject(resource) {
        vm.projectResources.push(new Resource(resource.id, resource.name, resource.occupation, resource.profile));

        //coloca a lista de recursos do gantt como a lista de recursos que controlamos.
        vm.ge.resources = vm.projectResources;

        vm.resource = {};
    }
    ;

    function removeResourceInProject(resource) {
        vm.projectResources.splice(vm.projectResources.indexOf(resource), 1);
        vm.ge.resources = vm.projectResources;
    }
    ;

    function editTask($event) {
        //atualiza as atividades do projeto do escopo
        vm.currentProject.tasks = vm.ge.saveGantt().tasks;

        //obtem a posição da task
        var position = $event.parent().index();

        vm.currentTask = vm.currentProject.tasks[position];

        //abre o editor
//        createBlackPage(800, 500).append($.JST.createFromTemplate({}, "TASK_EDITOR"));
        vm.showEditTask($event);

    }

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

});