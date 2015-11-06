UserModule.service('userService', function ($http) {
    this.showUsers = function (page) {
        return $http.get("user/list")
                .then(function (response) {
                    return response.data;
                },
                    function (errResponse) {
                        return errResponse;
                    });
    }
});