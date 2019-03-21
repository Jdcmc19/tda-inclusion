app = angular.module('incursionApp', []);


app.controller('inclusionController', function($scope, $http){


$scope.inclusion = {
        "userName": "",
        "userCarnet": "",
        "sedeSeleccionada": {
            "sede_id": 0,
            "nombre_sede": "" 
        },
        "modalidad": "",
        "escuela": "",
        "curso": "",
        "grupo": ""

    };

   
    
    $scope.sedeQuery = [];
    $scope.escuelaQuery = [];


    $http({
        method: 'GET',
        url: 'api/get_sedes'
    }).then(function(response){
        console.dir(response);
        $scope.sedeQuery = response.data;
    });



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
            console.dir(response);

        }, function(error) {
            console.error(error);
        });
    }


$scope.getEscuelas = function(){
    console.dir($scope.inclusion.sedeSeleccionada.id_sede);

    $http({
            method: 'POST',
            url: 'api/get_escuelas',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            transformRequest: function(obj) {
                var str = [];
                for(var p in obj)
                str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
                return str.join("&");
            },
            data: { sede_id: $scope.inclusion.sedeSeleccionada.id_sede }
        }).then(function(response){
            console.dir(response);
            $scope.escuelaQuery = response.data;

        }, function(error) {
            console.error(error);

        });
    }

});