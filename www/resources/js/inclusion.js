app = angular.module('incursionApp', []);


app.controller('inclusionController', function($scope, $http){


$scope.inclusion = {
        "userName": "",
        "userCarnet": "",
        "sede": "",
        "modalidad": "",
        "escuela": "",
        "curso": "",
        "grupo": ""

    };

$scope.enviarInclusion = function(){

        $http({
            method: 'POST',
            url: 'api/post_inclusion',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            transformRequest: function(obj) {
                var str = [];
                for(var p in obj)
                str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
                return str.join("&");
            },
            data : { name: $scope.inclusion.userName, carnet: $scope.inclusion.userCarnet, sede: $scope.inclusion.sede , modalidad: $scope.inclusion.modalidad, escuela: $scope.inclusion.escuela, curso: $scope.inclusion.curso, grupo: $scope.inclusion.grupo}
        }).then(function(response){
            console.dir(data);

        }, function(error) {
            console.error(error);
        });
    }

});