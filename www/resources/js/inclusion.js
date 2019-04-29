app = angular.module('incursionApp', []);


app.controller('inclusionController', function($scope, $http){


$scope.inclusion = {
        "userCarnet": "",
        "asusnto": "",
        "comentario": "",
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

    $("#Escuelas").prop('disabled', true);
    $("#Cursos").prop('disabled', true);
    $("#Grupos").prop('disabled', true);



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
            data : { grupo: $scope.inclusion.grupoSeleccionada.id_grupo }
        }).then(function(response){
            console.dir(response);

        }, function(error) {
            console.error(error);
        });
    }


$scope.getEscuelas = function(){

    
    $("#Escuelas").prop('disabled', false);
    $("#Cursos").prop('disabled', true);
    $("#Grupos").prop('disabled', true);
    
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

    $("#Escuelas").val("");
    $("#Grupos").val("");
    $("#Cursos").val("");
    }



$scope.getCursos = function(){

    
    $("#Cursos").prop('disabled', false);

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
            data: { sede_id: $scope.inclusion.sedeSeleccionada.id_sede, escuela_id: $scope.inclusion.escuelaSeleccionada.id_escuela }
        }).then(function(response){
            console.dir(response);
            $scope.cursoQuery = response.data;

        }, function(error) {
            console.error(error);

        });


    $("#Cursos").val("");
    }



$scope.getGrupos = function(){

    
    $("#Grupos").prop('disabled', false);

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
    $("#Grupos").val("");
    }



$scope.enviarComentario = function(){

        $http({
            method: 'POST',
            url: 'api/post_comentario',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            transformRequest: function(obj) {
                var str = [];
                for(var p in obj)
                str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
                return str.join("&");
            },
            data : {id_escuela: $scope.inclusion.escuelaSeleccionada.id_escuela, mensaje: $scope.inclusion.comentario , asunto: $scope.inclusion.asusnto}
        }).then(function(response){
            console.dir(response);

        }, function(error) {
            console.error(error);
        });
    }





});