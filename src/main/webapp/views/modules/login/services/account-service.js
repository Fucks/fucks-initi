/*
 * CRIA O SERVICE E SEUS METODOS
 */
LoginModule.service('accountService', function ($http) {

    this.register = function (account) {
        return $http.post('user/create', account)
                .then(function (response) {
                    return "Usuário Cadastrado!";
                },
                    function (errResponse) {
                        console.log(errResponse);
                        return "Erro ao cadastrar usuário, " + errResponse.data.exception;
                    });
}
});