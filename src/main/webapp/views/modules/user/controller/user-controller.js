'use strict';

function UserController($injector, $scope, $state, $stateParams, userService) {

    $injector.invoke(AbstractController, this, {$scope: $scope});

    //States

    //Vars
    $scope.error;
    $scope.confirmPassword;
    $scope.users = [{}];
    $scope.currentPage;

    /**
     * 
     * @param {type} toState
     * @param {type} toParams
     * @returns {undefined}
     */
    $scope.init = function (toState, toParams) {
        
        $scope.currentState = toState.name;
        $scope.currentPage = {page: 0, limit: 15, query: "", content: []};

        $scope.loadUsers();

        $('.tooltipped').tooltip({delay: 50});

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
}
;