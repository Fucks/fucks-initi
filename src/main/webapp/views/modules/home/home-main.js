'use strict';

var HomeModule = angular.module("Home", ['ngAnimate', 'ngCookies', 'ngTouch',
    'ngSanitize', 'ui.router'])

        .config(function ($stateProvider, $urlRouterProvider) {

            // Use $urlRouterProvider to configure any redirects (when) and invalid urls (otherwise).
            $urlRouterProvider.otherwise('/');

            // Use $stateProvider to configure your states.
            $stateProvider.state('home', {
                url: "/",
                templateUrl: "views/modules/home/ui/home.jsp",
                title: 'Bem vindo',
                controller: HomeController
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
        }
        );

angular.element(document).ready(function () {
    angular.bootstrap(document, ['Home']);
});