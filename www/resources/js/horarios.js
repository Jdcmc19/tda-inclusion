app = angular.module('incursionApp', []);


app.controller('horariosController', function($scope, $http){


$scope.inclusion = {
        "sedeSeleccionada": {},
        "escuelaSeleccionada": {},
        "modalidades": {},
        "periodos": {}

    };

   
    
    $scope.sedeQuery = [];
    $scope.escuelaQuery = [];
    $scope.modalidadQuery = [];
    $scope.sortType     = 'sede_nombre'; // set the default sort type
  $scope.sortReverse  = false;  // set the default sort order
  $scope.search  = '';     
  
  
  


    $scope.resultQuery = [];


    $(document).ready(function(){//busca en la tabla
    $("#buscador").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#example tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });



    $http({
        method: 'GET',
        url: 'api/get_modalidades'
    }).then(function(response){
        console.dir(response);
        $scope.modalidadQuery = response.data;
    });


$scope.getGuia = function(){


    $http({

            method: 'POST',

            url: 'api/get_guia_horarios',

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

            $scope.resultQuery = response.data;



        }, function(error) {

            console.error(error);



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

        
$scope.getPeriodos = function(){

    
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




