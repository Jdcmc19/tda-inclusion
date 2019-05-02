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

