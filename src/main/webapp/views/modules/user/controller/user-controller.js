'use strict';

function UserController($injector, $scope, $state, $stateParams, userService) {

    $injector.invoke(AbstractController, this, {$scope: $scope});

    //States
    $scope.LIST_STATE = "users";
    $scope.INSERT_STATE = "users-insert";
    $scope.EDIT_STATE = "users-edit";
    $scope.DETAIL_STATE = "users-detail";
    $scope.DELETE_STATE = "users-delete";

    //Vars
    $scope.error;
    $scope.confirmPassword;
    $scope.users = [{}];
    $scope.currentPage;
    $scope.selected;

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
                $scope.loadUsers();

                break;
            }
            case $scope.INSERT_STATE:
            {
                $scope.currentEntity = {};

                break;
            }
            case $scope.DETAIL_STATE:
            {
                $scope.findUser(params.id);

                break;
            }
            case $scope.EDIT_STATE:
            {
                $scope.findUser(params.id);

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
        $state.go($scope.EDIT_STATE, {id: id});
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
    $scope.loadUsers = function () {
        userService.showUsersByParams($scope.currentPage)
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
        userService.findUser(id)
                .then(function (response) {
                    $scope.currentEntity = response;
                });
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
        if ($scope.currentEntity.password == $scope.confirmPassword && $scope.confirmPassword != null) {

            userService.register($scope.currentEntity)
                    .then(function (response) {
                        response = JSON.parse(response);
                        Materialize.toast(response.msg, 5000);
                        if (response.code == 200) {
                            $state.go($scope.LIST_STATE);
                        }
                    });

        } else {
            Materialize.toast("Senha e confirmar senha devem ser iguais", 5000);
        }

    };

    /**
     * 
     * @returns {undefined}
     */
    $scope.update = function () {
        if (!$scope.form.$valid) {
            Materialize.toast("Preencha todos os campos", 5000);
            return;
        }
        if ($scope.currentEntity.password == $scope.confirmPassword && $scope.confirmPassword != null) {

            userService.update($scope.currentEntity)
                    .then(function (response) {
                        response = JSON.parse(response);
                        Materialize.toast(response.msg, 5000);
                        if (response.code == 200) {
                            $state.go($scope.LIST_STATE);
                        }
                    });

        } else {
            Materialize.toast("Senha e confirmar senha devem ser iguais", 5000);
        }

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
        $scope.loadUsers();
    };

    /**
     * 
     * @param {type} $event
     * @returns {undefined}
     */
    $scope.delete = function ($event) {
        userService.deleteUsers($scope.selected)
                .then(function (response) {
                    Materialize.toast($scope.selected.length > 1 ? "Usuários excluidos" : "Usuário excluido", 5000);
                    $scope.selected = [];
                    $scope.loadUsers();

                }, function (response) {
                    console.log(response);
                    Materialize.toast("Erro ao excluir usuários, " + response.data.exception, 5000);
                })
    }
}
;