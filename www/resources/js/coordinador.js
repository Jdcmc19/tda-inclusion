app = angular.module('incursionApp', []);


app.controller('coordinadorController', function($scope, $http){


    


	$scope.resultQuery = [];





$(document).ready(function() {

    $('#example').DataTable( {

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


    $scope.getInclusionesEstudiantes = function(){

    $scope.infoGroupQuery = [];

    $http({
            method: 'POST',
            url: 'api/get_inclusionesCoordinador',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            transformRequest: function(obj) {
                var str = [];
                for(var p in obj)
                str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
                return str.join("&");
            },
            data: { modalidad_id: $scope.inclusion.modalidades.nombre_modalidad, periodo_id: $scope.inclusion.periodos.id_periodo }
        }).then(function(response){
            console.dir(response);
            $scope.resultQuery = response.data;

        }, function(error) {
            console.error(error);

        });
    }
        
   



});