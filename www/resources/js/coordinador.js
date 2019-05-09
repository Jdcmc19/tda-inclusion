app = angular.module('incursionApp', []);


app.controller('coordinadorController', function($scope, $http){


    


  $scope.sortType     = 'carne'; // set the default sort type
  $scope.sortReverse  = false;  // set the default sort order
  $scope.search  = '';    
  $scope.inclusionResult = []; 
  
  
  $scope.OptIncl = function(id,estado){

    
        if (estado == "Aceptada"){

            $http({
            method: 'POST',
            url: 'api/aceptar_inclusion',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            transformRequest: function(obj) {
                var str = [];
                for(var p in obj)
                str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
                return str.join("&");
                    },
                    data: { modalidad_id: $scope.inclusion.modalidades.nombre_modalidad, periodo_id: $scope.inclusion.periodos.id_periodo, sede_id: $scope.resultQuery[id].sede_nombre, escuela_id: $scope.resultQuery[id].escuela_nombre, curso_id: $scope.resultQuery[id].curso_nombre, grupo_id: $scope.resultQuery[id].grupo_numero, carne_id: $scope.resultQuery[id].carne }
                }).then(function(response){
                    console.dir(response);
                    $scope.resultQuery[id].estado = estado;

                }, function(error) {
                    console.error(error);

                });

        }
        else{

            $http({
            method: 'POST',
            url: 'api/rechazar_inclusion',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            transformRequest: function(obj) {
                var str = [];
                for(var p in obj)
                str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
                return str.join("&");
                    },
                    data: { modalidad_id: $scope.inclusion.modalidades.nombre_modalidad, periodo_id: $scope.inclusion.periodos.id_periodo, sede_id: $scope.resultQuery[id].sede_nombre, escuela_id: $scope.resultQuery[id].escuela_nombre, curso_id: $scope.resultQuery[id].curso_nombre, grupo_id: $scope.resultQuery[id].grupo_numero, carne_id: $scope.resultQuery[id].carne }
                }).then(function(response){
                    console.dir(response);
                    $scope.resultQuery[id].estado = estado;

                }, function(error) {
                    console.error(error);

                });

        }
 
    
    }


    $scope.resultQuery = [];


    $(document).ready(function(){//busca en la tabla
    $("#buscador").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#example tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });




$scope.cierreProceso = function(){
    $http({
        method: 'GET',
        url: 'api/finalizar_inclusion'
        }).then(function(response){
            console.dir(response);
            $scope.sedeQuery = response.data;
        });
        $scope.getInclusionesEstudiantes();

    }




	 $http({
        method: 'GET',
        url: 'api/get_modalidades'
    }).then(function(response){
        console.dir(response);
        $scope.modalidadQuery = response.data;
    });



$scope.getResultados = function(){


    
    $http({
            method: 'POST',
            url: 'api/get_resultados',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            transformRequest: function(obj) {
                var str = [];
                for(var p in obj)
                str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
                return str.join("&");
            },
            data: { modalidad_id: $scope.inclusion.modalidades.nombre_modalidad , periodo_id: $scope.inclusion.periodos.id_periodo }
        }).then(function(response){
            console.dir(response);
            $scope.inclusionResult = response.data;

        }, function(error) {
            console.error(error);

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


$('#imprimir').click(function(){
    console.log('alo')
    var printme= document.getElementById('coordinadorTabla2');
    var wme =  window.open("","","width=1100,height=900");
    wme.document.write(printme.outerHTML);
    wme.document.close();
    wme.focus();
    wme.print();
    wme.close();




  })

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
        
   




$scope.pintar = function(){
    $scope.getResultados();

    var aprobadas = 0
    var reprobadas = 0
    var max = 0
    if (aprobadas>reprobadas){
        max = aprobadas;
    }
    else{
        max = reprobadas;
    }
    
    var visible= document.getElementById('myChart')



    if (visible.style.display === "block"){

        visible.style.display = "none"







    }

    else{
        
        aprobadas = $scope.inclusionResult[0].aceptadas 
        reprobadas = $scope.inclusionResult[0].rechazadas

        visible.style.display = "block"

    }

    var ctx = document.getElementById('myChart').getContext('2d');

    var myChart = new Chart(ctx, {

        type: 'bar',

        data: {

            labels: ['Reprobadas', 'Aprobadas'],

            datasets: [{

                label: '# inclusiones',

                data: [reprobadas, aprobadas],

                backgroundColor: [

                    'rgba(255, 99, 132, 0.2)',

                    'rgba(54, 162, 235, 0.2)'



                ],

                borderColor: [

                    'rgba(255, 99, 132, 1)',

                    'rgba(54, 162, 235, 1)'



                ],

                borderWidth: 1

            }]

        },

        options: {

            scales: {

                yAxes: [{

                    ticks: {

                        suggestedMin: max-1,

                        suggestedMax: max,

                        stepSize: 2,

                        beginAtZero: true

                    }

                }]

            }

        }

    });

}











}       );