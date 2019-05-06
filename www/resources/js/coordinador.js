app = angular.module('incursionApp', []);


app.controller('coordinadorController', function($scope, $http){


    


  $scope.sortType     = 'carne'; // set the default sort type
  $scope.sortReverse  = false;  // set the default sort order
  $scope.search  = '';     
  
  
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
        
   



});