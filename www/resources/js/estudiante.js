app = angular.module('incursionApp', []);


app.controller('estudianteController', function($scope, $http){


    


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
        url: 'api/get_inclusionesEstudiantes'
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
        url: 'api/get_inclusionesEstudiantes'
    }).then(function(response){
        console.dir(response);
        $scope.resultQuery = response.data;
    }, function(error) {
        console.error(error);
    });
        
        
   



});


