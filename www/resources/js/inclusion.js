app = angular.module('incursionApp', []);


app.controller('inclusionController', function($scope, $http){


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

    /*

    $("#Sedes").prop('disabled', true);
    $("#Escuelas").prop('disabled', true);
    $("#Cursos").prop('disabled', true);
    $("#Grupos").prop('disabled', true);


    */

    $http({
        method: 'GET',
        url: 'api/get_modalidades'
    }).then(function(response){
        console.dir(response);
        $scope.modalidadQuery = response.data;
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
            data : { modalidad_id: $scope.inclusion.modalidades.nombre_modalidad, periodo_id: $scope.inclusion.periodos.id_periodo ,sede_id: $scope.inclusion.sedeSeleccionada.nombre_sede, escuela_id: $scope.inclusion.escuelaSeleccionada.nombre_escuela, curso_id: $scope.inclusion.cursoSeleccionada.nombre_curso, grupo_id: $scope.inclusion.grupoSeleccionada.id_grupo, comentario_asunto: $scope.inclusion.asusnto, comentario_mensaje: $scope.inclusion.comentario }
        }).then(function(response){
            console.dir(response);

        }, function(error) {
            console.error(error);
        });
    }


$scope.getEscuelas = function(){

    $scope.escuelaQuery = [];
    $scope.cursoQuery = [];
    $scope.grupoQuery = [];
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



$scope.getCursos = function(){

    $scope.cursoQuery = [];
    $scope.grupoQuery = [];
    $scope.infoGroupQuery = [];

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
            data: { modalidad_id: $scope.inclusion.modalidades.id_modalidad, periodo_id: $scope.inclusion.periodos.id_periodo, sede_id: $scope.inclusion.sedeSeleccionada.id_sede, escuela_id: $scope.inclusion.escuelaSeleccionada.id_escuela }
        }).then(function(response){
            console.dir(response);
            $scope.cursoQuery = response.data;

        }, function(error) {
            console.error(error);

        });


    }



$scope.getGrupos = function(){

    $scope.grupoQuery = [];
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



$scope.getInfoGroup = function(){

    $scope.infoGroupQuery = [];

    $http({
            method: 'POST',
            url: 'api/get_infoGroup',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            transformRequest: function(obj) {
                var str = [];
                for(var p in obj)
                str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
                return str.join("&");
            },
            data: { modalidad_id: $scope.inclusion.modalidades.id_modalidad, periodo_id: $scope.inclusion.periodos.id_periodo ,sede_id: $scope.inclusion.sedeSeleccionada.id_sede, escuela_id: $scope.inclusion.escuelaSeleccionada.id_escuela, curso_id: $scope.inclusion.cursoSeleccionada.id_curso, grupo_id: $scope.inclusion.grupoSeleccionada.id_grupo }
        }).then(function(response){
            console.dir(response);
            $scope.infoGroupQuery = response.data;

        }, function(error) {
            console.error(error);

        });
    }




$scope.getSedes = function(){

    $scope.sedeQuery = [];
    $scope.escuelaQuery = [];
    $scope.cursoQuery = [];
    $scope.grupoQuery = [];
    $scope.infoGroupQuery = [];


        $http({
        method: 'GET',
        url: 'api/get_sedes'
        }).then(function(response){
            console.dir(response);
            $scope.sedeQuery = response.data;
        });

    }

        
$scope.getPeriodos = function(){

    
    $scope.sedeQuery = [];
    $scope.escuelaQuery = [];
    $scope.cursoQuery = [];
    $scope.grupoQuery = [];
    $scope.periodoQuery = [];
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









});




