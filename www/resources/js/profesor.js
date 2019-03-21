app = angular.module('incursionApp', []);


app.controller('formController', function($scope, $http){

	$scope.form = {
		"name": "jose",
		"password": ""
	};

	$scope.result_query = [];


	$http({
        method: 'GET',
        url: 'api/get_info'
    }).then(function(response){
    	console.dir(response);
    	$scope.result_query = response.data;
    }, function(error) {
    	console.error(error);
    });



	$scope.addInfo = function(){

		$http({
            method: 'POST',
            url: 'api/insert-info',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
	        transformRequest: function(obj) {
	            var str = [];
	            for(var p in obj)
	            str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
	            return str.join("&");
	        },
            data : { name: $scope.form.name, password: $scope.form.password }
        }).then(function(response){
        	console.dir(response);
        }, function(error) {
        	console.error(error);
        });
    }



});