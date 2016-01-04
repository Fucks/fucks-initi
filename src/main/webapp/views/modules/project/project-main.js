'use strict';

angular.module("Project", ['ngAnimate', 'ngCookies', 'ngTouch',
    'ngSanitize', 'ngMaterial', 'directive.loading', 'md.data.table', 'ui.router'])

        .config(function ($stateProvider, $urlRouterProvider, $locationProvider) {

            // Use $urlRouterProvider to configure any redirects (when) and invalid urls (otherwise).
            $urlRouterProvider.otherwise('/');

            // Use $stateProvider to configure your states.
            $stateProvider
                    .state('projects', {
                        url: "/",
                        templateUrl: "views/modules/project/ui/project/project-list.jsp",
                        title: 'Gerenciar Projetos',
                        navigation: '/home',
                        controller: 'ProjectController',
                        controllerAs: 'controller'
                    }).state('project-insert', {
                url: "/novo",
                templateUrl: 'views/modules/project/ui/project/project-form.jsp',
                title: 'Novo Projeto',
                navigation: 'projects',
                controller: 'ProjectController',
                controllerAs: 'controller'
            }).state('cronograma', {
                url: "/:id/cronograma",
                templateUrl: "views/modules/project/ui/cronograma/gantt.jsp",
                title: 'Cronograma',
                navigation: 'projects',
                controller: 'CronogramaController',
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
            $(document).ready(function () {
                $(".button-collapse").sideNav();
                $(".dropdown-button").dropdown();
                $('[data-toggle="datepicker"]').datepicker();
                $.fn.datepicker.setDefaults({format:'dd/mm/yyyy', language: 'pt-BR'})
            });
        }
        );

angular.module("Project")
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
    angular.bootstrap(document, ['Project']);
});