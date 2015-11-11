/*
 * CRIA O SERVICE E SEUS METODOS
 */
LoginModule.service('accountService', function ($http) {

    this.register = function (account) {
        return $http.post('user/create', account)
                .then(function (response) {
                    return "{\"code\":" + response.status + ",\"msg\":\"Usuário Cadastrado!\"}";
                },
                        function (errResponse) {
                            return "{\"code\":500,\"msg\":\"Erro ao cadastrar usuário, " + errResponse.data.localizedMessage + "\"}";
                        });
    }
});
