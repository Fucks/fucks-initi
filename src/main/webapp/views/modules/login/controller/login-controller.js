'use strict';

function LoginController($rootScope, $scope, $state, $stateParams) {

    $scope.error;
    $scope.logout;

    $scope.init = function () {
        $scope.error = $scope.getParameterByName("error");
        $scope.logout = $scope.getParameterByName("logout"); 
        
        if($scope.error != null){
            Materialize.toast('Usuário e/ou senha incorretos!', 5000);
        }
        
    };

    $scope.getParameterByName = function (name) {
        var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
        if (results == null) {
            return null;
        }
        else {
            return results[1] || 0;
        }
    }

    $scope.$on('$stateChangeSuccess',
            function (event, toState, toParams, fromState, fromParams) {
                $scope.init();

            });
}
;