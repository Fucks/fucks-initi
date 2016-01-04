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
                    return "{\"code\":" + response.status + ",\"msg\":\"Projeto Cadastrado!\",\"data\":" + JSON.stringify(response.data) + "}";
                },
                        function (errResponse) {
                            return "{\"code\":500,\"msg\":\"Erro ao cadastrar projeto, " + errResponse.data.exception + "\"}";
                        });
    };
    this.importProject = function (file) {
        return $http({
                url: 'project/upload',
                method: 'POST',
                headers: {'Content-Type':'multipart/*'},
                data: new FormData(file)
            })
                .then(function (response) {
                    return "{\"code\":" + response.status + ",\"msg\":\"Projeto importado!\",\"data\":" + JSON.stringify(response.data) + "}";
                },
                        function (errResponse) {
                            return "{\"code\":500,\"msg\":\"Erro ao importar projeto, " + errResponse.data.exception + "\"}";
                        });
    };
});