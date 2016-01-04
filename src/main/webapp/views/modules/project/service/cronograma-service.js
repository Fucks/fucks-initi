/*
 * CRIA O SERVICE E SEUS METODOS
 */
angular.module("Project").service('cronogramaService', function ($http) {

    this.findProject = function (id) {
        return $http.get('project/find/' + id)
                .then(function (response) {
                    return response.data;
                },
                        function (errResponse) {
                            return "{\"code\":500,\"msg\":\"Erro ao carregar o projeto, " + errResponse.data.localizedMessage + "\"}";
                        });
    };

    this.updateProject = function (project) {
        return $http.post('project/update', project)
                .then(function (response) {
                    return "{\"code\":" + response.status + ",\"msg\":\"Projeto salvo!\",\"data\":" + JSON.stringify(response.data) + "}";
                },
                        function (errResponse) {
                            return "{\"code\":500,\"msg\":\"Erro ao salvar projeto, " + errResponse.data.exception + "\"}";
                        });
    };
});
