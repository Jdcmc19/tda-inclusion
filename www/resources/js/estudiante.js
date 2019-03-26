app = angular.module('incursionApp', []);


app.controller('estudianteController', function($scope, $http){


    


	$scope.resultQuery = [];


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


