'use strict';

function ProjectController($injector, $scope, $state, $stateParams, projectService) {

    $injector.invoke(AbstractController, this, {$scope: $scope});

    //Project States
    $scope.LIST_STATE = "projects";
    $scope.INSERT_STATE = "project-insert";
    $scope.CRONOGRAMA_STATE = "cronograma";
    
    //Cronograma States


    //Vars
    $scope.projects = [{}];
    $scope.currentPage;
    $scope.selected;
    $scope.currentEntity;

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
            case $scope.LIST_STATE:
            {
                $scope.currentPage = {page: 0, limit: '8', query: "", content: []};
                $scope.selected = new Array();
                $scope.loadProjects();

                break;
            }
            case $scope.INSERT_STATE:
            {
                $scope.currentEntity = {};

                break;
            }
            default :
            {
                $state.go($scope.LIST_STATE);

                break;
            }
        }
        $scope.currentState = state;
    };

    /**
     * 
     * @returns {undefined}
     * 
     */
    $scope.changeToNew = function () {
        $state.go($scope.INSERT_STATE);
    };

    /**
     * 
     * @returns {undefined}
     */
    $scope.changeToList = function () {
        $state.go($scope.LIST_STATE);
    };

    /**
     * 
     * @param {type} id
     * @returns {undefined}
     */
    $scope.changeToEdit = function (id) {
        $state.go($scope.CRONOGRAMA_STATE, {id: id});
    };

    /**
     * 
     * @param {type} id
     * @returns {undefined}
     */
    $scope.changeToDetail = function (id) {
        $state.go($scope.DETAIL_STATE);
    };

    /**
     * 
     * @returns {undefined}
     */
    $scope.loadProjects = function () {
        projectService.showByParams($scope.currentPage)
                .then(function (response) {
                    $scope.currentPage = response;
                    $scope.currentPage.query = "";
                    $scope.currentPage.pageNumber = response.number + 1;
                });

    };


    /**
     * 
     * @param {type} id
     * @returns {undefined}
     */
    $scope.findUser = function (id) {
//        userService.findUser(id)
//                .then(function (response) {
//                    $scope.currentEntity = response;
//
//                    userService.loadProfiles()
//                            .then(function (response) {
//                                $scope.profiles = response;
//                                $scope.profile = $scope.currentEntity.profile;
//                            });
//
//                });
    };

    /**
     * 
     * @returns {undefined}
     */
    $scope.insert = function () {
        if (!$scope.form.$valid) {
            Materialize.toast("Preencha todos os campos", 5000);
            return;
        }
        projectService.create($scope.currentEntity)
                .then(function (response) {
                    response = JSON.parse(response);
                    Materialize.toast(response.msg, 5000);
                    if (response.code == 200) {
                        $scope.changeToEdit(response.data.id);
                    }
                });


    };

    /**
     * GRID EVENTS
     */

    /**
     * 
     * @param {type} page
     * @param {type} limit
     * @returns {unresolved}
     */
    $scope.onPaginationChange = function (page, limit) {
        $scope.currentPage.page = page - 1;
        $scope.loadProjects();
    };

    /**
     * 
     * @param {type} $event
     * @returns {undefined}
     */
    $scope.delete = function ($event) {
//        userService.deleteUsers($scope.selected)
//                .then(function (response) {
//                    response = JSON.parse(response);
//                    Materialize.toast(response.msg, 5000);
//                    $scope.selected = [];
//                    $scope.loadProjects();
//                });
    }
}
;