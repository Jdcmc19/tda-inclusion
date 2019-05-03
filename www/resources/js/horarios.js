app = angular.module('incursionApp', []);


app.controller('horariosController', function($scope, $http){

$scope.horarios={
		 "sedeSeleccionada": {},
		 "carreraSeleccionada": {},
		 "periodoSeleccionada":{}

};

$scope.sedeQuery = [];
$scope.carreraQuery = [];
$scope.periodoQuery = [];

$scope.resultQuery = [];

$http({
        method: 'GET',
        url: 'api/get_modalidades'
    }).then(function(response){
        console.dir(response);
        $scope.modalidadQuery = response.data;
    });



$(document).ready(function() {

    $('#example').DataTable( {
        "paging":   false,
        "ordering": false,
        "info":     false,

        "initComplete": function () {

            var api = this.api();

            api.$('td').click( function () {

                api.search( this.innerHTML ).draw();

            } );

        },

        "language": {

            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"

                },

        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "Todos"]]

            } );

        } );


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





$scope.loadTable = function(){

    
}





});