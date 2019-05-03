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
        url: 'api/get_inclusionesCoordinador'
    }).then(function(response){
    	console.dir(response);
    	$scope.resultQuery = response.data;
    }, function(error) {
    	console.error(error);
    });


    $scope.refeshTable = function(){

        
    }

    
    $http({
        method: 'GET',
        url: 'api/get_inclusionesCoordinador'
    }).then(function(response){
        console.dir(response);
        $scope.resultQuery = response.data;
    }, function(error) {
        console.error(error);
    });
        
        
   



});