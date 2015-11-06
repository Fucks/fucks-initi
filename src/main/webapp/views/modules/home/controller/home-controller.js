'use strict';

function HomeController($rootScope, $scope, $state, $stateParams) {

    //inicia os componentes dos estilos.
    $(".button-collapse").sideNav();
    //States

    //Vars
    $scope.error;
    $scope.confirmPassword;

    /**
     * 
     * @param {type} toState
     * @param {type} toParams
     * @returns {undefined}
     */
    $scope.init = function (toState, toParams) {
        $scope.currentState = toState.name;
        $rootScope.title = "Bem vindo";
    };

    $scope.$on('$stateChangeSuccess', function (event, toState, toParams, fromState, fromParams) {
        $scope.init(toState, toParams);
    });
}
;