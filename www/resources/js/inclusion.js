app = angular.module('incursionApp', []);


app.controller('inclusionController', function($scope, $http){


$scope.inclusion = {
        "userName": "",
        "userCarnet": "",
        "sedeSeleccionada": {},
        "modalidad": "",
        "escuelaSeleccionada": {},
        "cursoSeleccionada": {},
        "grupoSeleccionada": {}

    };

   
    
    $scope.sedeQuery = [];
    $scope.escuelaQuery = [];
    $scope.cursoQuery = [];
    $scope.grupoQuery = [];


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
            data : { name: $scope.inclusion.userName, carnet: $scope.inclusion.userCarnet, sede: $scope.inclusion.sedeSeleccionada.nombre_sede ,
                escuela: $scope.inclusion.escuelaSeleccionada.nombre_escuela, curso: $scope.inclusion.cursoSeleccionada.nombre_curso, grupo: $scope.inclusion.grupoSeleccionada.numero_grupo}
        }).then(function(response){
            console.dir(response);

        }, function(error) {
            console.error(error);
        });
    }


$scope.getEscuelas = function(){

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



$scope.getCursos = function(){
    console.dir($scope.inclusion.escuelaSeleccionada);
    $http({
            method: 'POST',
            url: 'api/get_cursos',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            transformRequest: function(obj) {
                var str = [];
                for(var p in obj)
                str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
                return str.join("&");
            },
            data: { escuela_id: $scope.inclusion.escuelaSeleccionada.id_escuela }
        }).then(function(response){
            console.dir(response);
            $scope.cursoQuery = response.data;

        }, function(error) {
            console.error(error);

        });
    }

$scope.getGrupos = function(){
    $http({
            method: 'POST',
            url: 'api/get_grupos',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            transformRequest: function(obj) {
                var str = [];
                for(var p in obj)
                str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
                return str.join("&");
            },
            data: { curso_id: $scope.inclusion.cursoSeleccionada.id_curso }
        }).then(function(response){
            console.dir(response);
            $scope.grupoQuery = response.data;

        }, function(error) {
            console.error(error);

        });
    }





});