'use strict';

angular.module("System", ['ngAnimate', 'ngCookies', 'ngTouch',
    'ngSanitize', 'ngMaterial', 'directive.loading', 'md.data.table', 'ui.router'])

        .config(function ($stateProvider, $urlRouterProvider) {

            // Use $urlRouterProvider to configure any redirects (when) and invalid urls (otherwise).
            $urlRouterProvider.otherwise('/');

            // Use $stateProvider to configure your states.
            $stateProvider.state('home', {
                url: "/",
                templateUrl: "views/modules/app/ui/home/home.jsp",
                title: 'Bem vindo',
                controller: 'HomeController',
                controllerAs: 'controller'
            });

            //usuarios
            $stateProvider
                    .state('users', {
                        url: "/user-module",
                        templateUrl: "views/modules/app/ui/user/user-list.jsp",
                        title: 'Gerenciar usuários',
                        navigation: '/home',
                        controller: 'UserController',
                        controllerAs: 'controller'
                    }).state('users-insert', {
                url: "/novo",
                templateUrl: 'views/modules/app/ui/user/user-form.jsp',
                title: 'Novo Usuário',
                navigation: 'users',
                controller: 'UserController',
                controllerAs: 'controller'
            })
                    .state('users-edit', {
                        url: "/editar/:id",
                        templateUrl: 'views/modules/app/ui/user/user-form.jsp',
                        title: 'Editar usuário',
                        navigation: 'users',
                        controller: 'UserController',
                        controllerAs: 'controller'
                    });

        })
        .run(function ($rootScope, $state, $stateParams) {

            // It's very handy to add references to $state and $stateParams to the $rootScope
            // so that you can access them from any scope within your applications.For example,
            // <li ng-class="{ active: $state.includes('contacts.list') }"> will set the <li>
            // to active whenever 'contacts.list' or one of its decendents is active.
            $rootScope.$state = $state;
            $rootScope.$stateParams = $stateParams;

            //inicia os componentes dos estilos.
            $(".button-collapse").sideNav();
        });

angular.module("System")
        .controller("HeaderController", function ($rootScope, userService) {

            var vm = this;

            //vars
            vm.currentUser = {};
            vm.title = $rootScope.title;
            vm.navigation = $rootScope.navigation;

            //methods
            vm.loadUser = loadUser();

            /**
             * 
             * @returns {undefined}
             */
            function loadUser() {
                userService.getAuthenticated().then(function (response) {
                    vm.currentUser = response;
                });
            }

        });
angular.element(document).ready(function () {
    angular.bootstrap(document, ['System']);
});