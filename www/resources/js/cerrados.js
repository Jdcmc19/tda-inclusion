app = angular.module('incursionApp', []);


app.controller('cerradosController', function($scope, $http){



$scope.inclusion = {
        "userCarnet": "",
        "asusnto": "",
        "comentario": "",
        "sedeSeleccionada": {},
        "escuelaSeleccionada": {},
        "cursoSeleccionada": {},
        "grupoSeleccionada": {},
        "modalidades": {},
        "periodos": {}

    };

    
    $scope.sedeQuery = [];
    $scope.escuelaQuery = [];
    $scope.cursoQuery = [];
    $scope.grupoQuery = [];
    $scope.modalidadQuery = [];
    $scope.periodoQuery = [];
    $scope.infoGroupQuery = [];

 

 $http({
        method: 'GET',
        url: 'api/get_modalidades'
    }).then(function(response){
        console.dir(response);
        $scope.modalidadQuery = response.data;
    });

        
$scope.getPeriodos = function(){

    
    $scope.infoGroupQuery = [];
    
    $http({
            method: 'POST',
            url: 'api/get_periodos',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            transformRequest: function(obj) {
                var str = [];
                for(var p in obj)
                str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
                return str.join("&");
            },
            data: { modalidad_id: $scope.inclusion.modalidades.id_modalidad}
        }).then(function(response){
            console.dir(response);
            $scope.periodoQuery = response.data;

        }, function(error) {
            console.error(error);

        });

    
    }


$scope.getSedes = function(){


    $scope.infoGroupQuery = [];

        $http({
        method: 'GET',
        url: 'api/get_sedes'
        }).then(function(response){
            console.dir(response);
            $scope.sedeQuery = response.data;
        });

    }




$scope.getEscuelas = function(){

    $scope.infoGroupQuery = [];
    
    
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



$scope.getGrupos = function(){

    $scope.infoGroupQuery = [];

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
            data: { modalidad_id: $scope.inclusion.modalidades.id_modalidad, periodo_id: $scope.inclusion.periodos.id_periodo ,sede_id: $scope.inclusion.sedeSeleccionada.id_sede, escuela_id: $scope.inclusion.escuelaSeleccionada.id_escuela, curso_id: $scope.inclusion.cursoSeleccionada.id_curso }
            
        }).then(function(response){
            console.dir(response);
            $scope.grupoQuery = response.data;

        }, function(error) {
            console.error(error);

        });
    }



})