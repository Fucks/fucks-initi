'use strict';

function UserController($rootScope, $scope, $state, $stateParams, userService) {

    //States

    //Vars
    $scope.error;
    $scope.confirmPassword;
    $scope.users = [{}];

    /**
     * 
     * @param {type} toState
     * @param {type} toParams
     * @returns {undefined}
     */
    $scope.init = function (toState, toParams) {
        $scope.currentState = toState.name;
        $rootScope.title = toState.title;
        $rootScope.navigation = toState.navigation;

        $scope.loadUsers();
    };

    $scope.loadUsers = function () {
        userService.showUsers(0)
                .then(function (response) {
                    $scope.users = response;
                });
    }

    $scope.$on('$stateChangeSuccess', function (event, toState, toParams, fromState, fromParams) {
        $scope.init(toState, toParams);
    });
}
;