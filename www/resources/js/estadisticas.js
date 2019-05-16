app = angular.module('incursionApp', []);


app.controller('estadisticasController', function($scope, $http){


    




  
  

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

            var max = 0
            var aprobadas = response.data.aceptadas
            var reprobadas = response.data.rechazadas
            
            var visible= document.getElementById('myChart')



            if (visible.style.display === "none"){

                visible.style.display = "block"







            }

            

            var ctx = document.getElementById('myChart').getContext('2d');

            var myChart = new Chart(ctx, {

                type: 'bar',

                data: {

                    labels: ['Reprobadas', 'Aprobadas', 'Total'],

                    datasets: [{

                        label: '# inclusiones',

                        data: [reprobadas, aprobadas, parseInt(reprobadas)+parseInt(aprobadas)],

                        backgroundColor: [

                            'rgba(255, 99, 132, 0.2)',

                            'rgba(54, 162, 235, 0.2)',

                            'rgb(0,255,127)'



                        ],

                        borderColor: [

                            'rgba(255, 99, 132, 1)',

                            'rgba(54, 162, 235, 1)',

                            'rgb(50,205,50)'



                        ],

                        borderWidth: 1

                    }]

                },

                options: {

                    scales: {

                        yAxes: [{

                            ticks: {

                                suggestedMin: max,

                                suggestedMax: max,

                                stepSize: 2,

                                beginAtZero: true

                            }

                        }]

                    }

                }

            });



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











}       );