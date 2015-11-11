'use strict';

function HomeController($injector, $scope, $state, $stateParams) {

    /**
     * Inject methods, attributes and states inherited of the AbstractCRUDController 
     * @see AbstractCRUDController
     */
    $injector.invoke(AbstractController, this, {$scope: $scope});

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
    };
}
;