app = angular.module('incursionApp', []);


app.controller('estadisticasController', function($scope, $http){


    



  $scope.inclusionResult = []; 
  
  

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
        
        aprobadas = 4
        reprobadas = 2

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