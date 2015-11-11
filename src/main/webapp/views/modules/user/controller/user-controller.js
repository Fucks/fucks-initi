'use strict';

function UserController($injector, $scope, $state, $stateParams, userService) {

    $injector.invoke(AbstractController, this, {$scope: $scope});

    //States
    $scope.LIST_STATE = "users";
    $scope.INSERT_STATE = "users-insert";
    $scope.DETAIL_STATE = "detail";
    $scope.DELETE_STATE = "delete";

    //Vars
    $scope.error;
    $scope.confirmPassword;
    $scope.users = [{}];
    $scope.currentPage;
    $scope.confirmPassword;

    /**
     * 
     * @param {type} toState
     * @param {type} toParams
     * @returns {undefined}
     */
    $scope.init = function (toState, toParams) {
        $('.tooltipped').tooltip({delay: 50});
        var state = toState.name;

        switch (state) {
            case $scope.LIST_STATE:
            {
                $scope.currentPage = {page: 0, limit: 15, query: "", content: []};
                $scope.loadUsers();

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
     * @returns {undefined}
     */
    $scope.loadUsers = function () {
        userService.showUsersByParams($scope.currentPage)
                .then(function (response) {
                    $scope.currentPage.content = response;
                });

        $scope.currentPage.query = "";
    };

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
}
;