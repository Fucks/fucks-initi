angular.module("Project").service('userService', function ($http) {
    this.showUsersByParams = function (filter) {
        return $http.get("user/list", {params: {'filter': filter, 'page': 0, 'limit': 8}}, null)
                .then(function (response) {
                    return response.data;
                },
                        function (errResponse) {
                            return errResponse;
                        });
    };
    this.findUser = function (id) {
        return $http.get("user/find", {params: {'id': id}}, null)
                .then(function (response) {
                    return response.data;
                },
                        function (errResponse) {
                            return errResponse;
                        });
    };
    this.getAuthenticated = function () {
        return $http.get("user/authenticated")
                .then(function (response) {
                    return response.data;
                },
                        function (errResponse) {
                            return errResponse;
                        });
    };
    this.loadProfiles = function () {
        return $http.get('user/profiles')
                .then(function (response) {
                    return response.data;
                },
                        function (errResponse) {
                            return errResponse.data.exception;
                        });
    }
});