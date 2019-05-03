app = angular.module('incursionApp', []);


app.controller('estudianteController', function($scope, $http){


    


	$scope.resultQuery = [];


    /*Revisar Porque PUTAS no se puede filtrar luego de cargar*/

    /*$(document).ready(function() {
    $('#example').DataTable( {
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
                },
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "Todos"]]
            } );


        } );


    //Estas son para el coordinados

    //Esto permite saber que linea fue clickeada
    /*
    $(document).ready(function() {
    var table = $('#example').DataTable();
     
    $('#example tbody').on('click', 'tr', function () {
            var data = table.row( this ).data();
            alert( 'You clicked on '+data[0]+'\'s row' );
        } );
    } );
    */



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
            url: 'api/get_inclusionesEstudiantes',
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


