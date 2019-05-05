app = angular.module('incursionApp', []);


app.controller('estudianteController', function($scope, $http){


  $scope.sortType     = 'sede_nombre'; // set the default sort type
  $scope.sortReverse  = false;  // set the default sort order
  $scope.search  = '';     
  
    function eliminarInclusion(id){

        boton =document.getElementById(id)
        boton.addEventListener("click", function(){
            
            var $row = $(this).closest("tr"),
                $tds = $row.find("td:nth-child(1)");
            $.each($tds,function(){
                console.log($(this).text());
                $("#Parrafo").text($(this).text())
            })
            
            
        })

          
            
        };
    


	$scope.resultQuery = [];


    $(document).ready(function(){//busca en la tabla
    $("#buscador").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#example tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });



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


