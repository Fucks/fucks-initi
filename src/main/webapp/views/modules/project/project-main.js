'use strict';

angular.module("Project", ['System', 'ngAnimate', 'ngCookies', 'ngTouch',
    'ngSanitize', 'ui.router', 'directive.loading', 'ngMaterial', 'md.data.table'])

        .config(function ($stateProvider, $urlRouterProvider, $locationProvider) {

            // Use $urlRouterProvider to configure any redirects (when) and invalid urls (otherwise).
            $urlRouterProvider.otherwise('/');

            // Use $stateProvider to configure your states.
            $stateProvider
                    .state('projects', {
                        url: "/",
                        templateUrl: "views/modules/project/project/ui/project-list.jsp",
                        title: 'Gerenciar Projetos',
                        navigation: '/home',
                        controller: ProjectController
                    }).state('project-insert', {
                        url: "/novo",
                        templateUrl: 'views/modules/project/project/ui/project-form.jsp',
                        title: 'Novo Projeto',
                        navigation: 'projects',
                        controller: ProjectController
                    }).state('cronograma', {
                        url: "/:id/cronograma",
                        templateUrl: "views/modules/project/cronograma/ui/gantt.jsp",
                        title: 'Cronograma',
                        navigation: 'projects',
                        controller: CronogramaController
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
            });
        }
        );

angular.element(document).ready(function () {
    angular.bootstrap(document, ['Project']);
});