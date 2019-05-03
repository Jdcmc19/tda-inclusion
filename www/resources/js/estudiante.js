app = angular.module('incursionApp', []);


app.controller('estudianteController', function($scope, $http){


    


	$scope.resultQuery = [];


function format ( d ) {
    // `d` is the original data object for the row
    return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
        '<tr>'+
            '<td>Full name:</td>'+
            '<td>'+d.name+'</td>'+
        '</tr>'+
        '<tr>'+
            '<td>Extension number:</td>'+
            '<td>'+d.extn+'</td>'+
        '</tr>'+
        '<tr>'+
            '<td>Extra info:</td>'+
            '<td>And any further details here (images etc)...</td>'+
        '</tr>'+
    '</table>';
}


    $(document).ready(function() {
    $('#example').DataTable( {
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
                },
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "Todos"]]
            } );



        // Add event listener for opening and closing details
    $('#example tbody').on('click', 'td.details-control', function () {
        var tr = $(this).closest('tr');
        var row = table.row( tr );
 
        if ( row.child.isShown() ) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        }
        else {
            // Open this row
            row.child( format(row.data()) ).show();
            tr.addClass('shown');
        }
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



        
        
   



});


