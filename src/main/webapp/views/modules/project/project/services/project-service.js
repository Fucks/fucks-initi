angular.module("Project").service('projectService', function ($http) {
    this.showByParams = function (page) {
        return $http.get("project/list", {params: {'filter': page.query, 'page': page.page, 'limit': page.limt}}, null)
                .then(function (response) {
                    return response.data;
                },
                function (errResponse) {
                    return errResponse;
                });
    };
     this.create = function (project) {
        return $http.post('project/create', project)
                .then(function (response) {
                    return "{\"code\":" + response.status + ",\"msg\":\"Projeto Cadastrado!\",\"data\":"+JSON.stringify(response.data)+"}";
                },
                        function (errResponse) {
                            return "{\"code\":500,\"msg\":\"Erro ao cadastrar projeto, " + errResponse.data.exception + "\"}";
                        });
    };
});