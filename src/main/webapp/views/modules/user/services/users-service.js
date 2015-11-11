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
    this.showUsersByParams = function (page) {
        return $http.get("user/list", {params:{'filter':page.query, 'page': page.page,'limit':page.limt}}, null)
                .then(function (response) {
                    return response.data.content;
                },
                        function (errResponse) {
                            return errResponse;
                        });
    }
});