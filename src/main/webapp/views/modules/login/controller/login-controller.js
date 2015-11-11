'use strict';

function LoginController($injector, $scope, $state, $stateParams, accountService) {

    $injector.invoke(AbstractController, this, {$scope: $scope});

    //States
    $scope.LOGIN_STATE = 'login';
    $scope.REGISTER_STATE = 'register';

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

        switch ($scope.currentState) {
            case $scope.LOGIN_STATE:
            {
                $rootScope.title = "Login";
                $scope.error = $scope.getParameterByName("error");
                $scope.logout = $scope.getParameterByName("logout");

                if ($scope.error != null) {
                    Materialize.toast('Usuário e/ou senha incorretos!', 5000);
                }

                break;
            }
            case $scope.REGISTER_STATE:
            {
                $rootScope.title = "Registre-se";
                $scope.currentRegisterer = {};

                Materialize.showStaggeredList('#register');

                break;
            }
            default :
            {
                $state.go($scope.LOGIN_STATE);

                break;
            }
        }

    };

    $scope.goToRegister = function () {
        $state.go($scope.REGISTER_STATE);
    };

    $scope.goToLogin = function () {
        $state.go($scope.LOGIN_STATE);
    };

    $scope.registerer = function () {
        if (!$scope.registerForm.$valid) {
            Materialize.toast("Preencha todos os campos", 5000);
            return;
        }
        if ($scope.currentRegisterer.password == $scope.confirmPassword && $scope.confirmPassword != null) {

            accountService.register($scope.currentRegisterer)
                    .then(function (response) {
                        response = JSON.parse(response);
                        Materialize.toast(response.msg, 5000);
                        if (response.code == 200) {
                            $state.go($scope.LOGIN_STATE);
                        }
                    });

        } else {
            Materialize.toast("Senha e confirmar senha devem ser iguais", 5000);
        }

    }

    $scope.$on('$stateChangeSuccess', function (event, toState, toParams, fromState, fromParams) {
        $scope.init(toState, toParams);
    });

    $scope.getParameterByName = function (name) {
        var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
        if (results == null) {
            return null;
        }
        else {
            return results[1] || 0;
        }
    }
}
;