app = angular.module('incursionApp', []);


app.controller('cerradosController', function($scope, $http){



    $http({
        method: 'GET',
        url: 'api/get_modalidades'
    }).then(function(response){
        console.dir(response);
        $scope.modalidadQuery = response.data;
    });

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
            data: { modalidad_id: $scope.inclusion.modalidades.id_modalidad, periodo_id: $scope.inclusion.periodos.id_periodo ,sede_id: $scope.inclusion.sedeSeleccionada.id_sede, escuela_id: $scope.inclusion.escuelaSeleccionada.id_escuela, curso_id: $scope.inclusion.cursoSeleccionada.id_curso }
            
        }).then(function(response){
            console.dir(response);
            $scope.grupoQuery = response.data;

        }, function(error) {
            console.error(error);

        });
    }


$scope.grupos = function(id){
   

    

   if(id==1){


    $http({
            method: 'POST',
            url: 'api/cerrar_curso',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            transformRequest: function(obj) {
                var str = [];
                for(var p in obj)
                str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
                return str.join("&");
            },
            data: { modalidad_id: $scope.inclusion.modalidades.id_modalidad, periodo_id: $scope.inclusion.periodos.id_periodo, sede_id: $scope.inclusion.sedeSeleccionada.id_sede, escuela_id: $scope.inclusion.escuelaSeleccionada.id_escuela, curso_id: $scope.inclusion.cursoSeleccionada.id_curso, modalidad_nombre: $scope.inclusion.modalidades.modalidad_nombre,sede_nombre: $scope.inclusion.sedeSeleccionada.sede_nombre, escuela_nombre: $scope.inclusion.escuelaSeleccionada.escuela_nombre   ,  curso_nombre: $scope.inclusion.cursoSeleccionada.curso_nombre, grupo_id: $scope.inclusion.grupoSeleccionada.id_grupo }
        }).then(function(response){
            console.dir(response);
            alert("El grupo "+ $scope.inclusion.grupoSeleccionada.id_grupo+ " de " + $scope.inclusion.cursoSeleccionada.curso_nombre + "fue cerrado exitosamente");


        }, function(error) {
            console.error(error);

        });


    }



    else{


        $http({
            method: 'POST',
            url: 'api/abrir_curso',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            transformRequest: function(obj) {
                var str = [];
                for(var p in obj)
                str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
                return str.join("&");
            },
            data: { modalidad_nombre: $scope.inclusion.modalidades.modalidad_nombre, periodo_id: $scope.inclusion.periodos.id_periodo,sede_nombre: $scope.inclusion.sedeSeleccionada.sede_nombre, escuela_nombre: $scope.inclusion.escuelaSeleccionada.escuela_nombre   ,  curso_nombre: $scope.inclusion.cursoSeleccionada.curso_nombre, grupo_id: $scope.inclusion.grupoSeleccionada.id_grupo }
        }).then(function(response){
            console.dir(response);
            alert("El grupo "+ $scope.inclusion.grupoSeleccionada.id_grupo+ " de " + $scope.inclusion.cursoSeleccionada.curso_nombre + "fue abierto exitosamente")

        }, function(error) {
            console.error(error);

        });









    }












   }




$scope.getEscuelas = function(){

    $scope.escuelaQuery = [];
    $scope.cursoQuery = [];
    $scope.grupoQuery = [];
    
    
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








$scope.getSedes = function(){

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

    }

        
$scope.getPeriodos = function(){

    $scope.sedeQuery = [];
    $scope.escuelaQuery = [];
    $scope.cursoQuery = [];
    $scope.grupoQuery = [];
    $scope.periodoQuery = [];

    
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




