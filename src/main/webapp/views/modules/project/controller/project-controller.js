'use strict';

angular.module("Project").controller('ProjectController', function ($injector, $scope, $state, $stateParams, projectService) {

    var vm = this;

    $injector.invoke(AbstractController, this, {$scope: $scope});

    //States
    vm.LIST_STATE = "projects";
    vm.INSERT_STATE = "project-insert";
    vm.CRONOGRAMA_STATE = "cronograma";

    //Vars
    vm.currentEntity;
    vm.currentPage;
    vm.mppfile;
    vm.projects = [{}];
    vm.selected;

    //Methods
    vm.changeToNew = changeToNew;
    vm.changeToList = changeToList;
    vm.changeToEdit = changeToEdit;
    vm.changeToDetail = changeToDetail;
    vm.importProject = importProject;
    vm.insert = insert;
    vm.loadProjects = loadProjects;
    vm.onPaginationChange = onPaginationChange;
    vm.remove = remove;

    /**
     * 
     * @param {type} toState
     * @param {type} toParams
     * @returns {undefined}
     */
    $scope.init = function (toState, toParams) {
        var state = toState.name;
        var params = toParams;

        switch (state) {
            case vm.LIST_STATE:
            {
                vm.currentPage = {page: 0, limit: '8', query: "", content: []};
                vm.selected = new Array();
                vm.loadProjects();

                break;
            }
            case vm.INSERT_STATE:
            {
                vm.currentEntity = {};

                break;
            }
            default :
            {
                $state.go(vm.LIST_STATE);

                break;
            }
        }
        vm.currentState = state;
    };

    /**
     * 
     * @returns {undefined}
     * 
     */
    function changeToNew() {
        $state.go(vm.INSERT_STATE);
    }
    ;

    /**
     * 
     * @returns {undefined}
     */
    function changeToList() {
        $state.go(vm.LIST_STATE);
    }
    ;

    /**
     * 
     * @param {type} id
     * @returns {undefined}
     */
    function changeToEdit(id) {
        $state.go(vm.CRONOGRAMA_STATE, {id: id});
    }
    ;

    /**
     * 
     * @param {type} id
     * @returns {undefined}
     */
    function changeToDetail(id) {
        $state.go(vm.DETAIL_STATE);
    }
    ;

    /**
     * 
     * @returns {undefined}
     */
    function loadProjects() {
        projectService.showByParams(vm.currentPage)
                .then(function (response) {
                    vm.currentPage = response;
                    vm.currentPage.query = "";
                    vm.currentPage.pageNumber = response.number + 1;
                });

    }
    ;

    /**
     * 
     * @returns {undefined}
     */
    function insert() {
        if (!$scope.form.$valid) {
            $scope.showToast("Preencha todos os campos", 5000);
            return;
        }
        projectService.create(vm.currentEntity)
                .then(function (response) {
                    response = JSON.parse(response);
                    $scope.showToast(response.msg, 5000);
                    if (response.code == 200) {
                        vm.changeToEdit(response.data.id);
                    }
                });


    }
    ;

    /**
     * GRID EVENTS
     */

    /**
     * 
     * @param {type} page
     * @param {type} limit
     * @returns {unresolved}
     */
    function onPaginationChange(page, limit) {
        vm.currentPage.page = page - 1;
        vm.loadProjects();
    }
    ;

    function importProject(input) {
        projectService.importProject(input.files[0])
                .then(function (response) {
                    response = JSON.parse(response);
                    $scope.showToast(response.msg, 5000);
                    if (response.code == 200) {
                        vm.changeToEdit(response.data.id);
                    }
                });
    }

    /**
     * 
     * @param {type} $event
     * @returns {undefined}
     */
    function remove($event) {
//        userService.deleteUsers($scope.selected)
//                .then(function (response) {
//                    response = JSON.parse(response);
//                    Materialize.toast(response.msg, 5000);
//                    $scope.selected = [];
//                    $scope.loadProjects();
//                });
    }
});