app = angular.module('incursionApp', []);


app.controller('estudianteController', function($scope, $http){


    
    $scope.comentario = {
        "userName": "",
        "comentario": ""

    };

    $scope.inclusion = {
        "userName": "",
        "comentario": ""

    };

	$scope.resultQuery = [];


	$http({
        method: 'GET',
        url: 'api/get_inclusionesEstudiante'
    }).then(function(response){
    	console.dir(response);
    	$scope.resultQuery = response.data;
    }, function(error) {
    	console.error(error);
    });


    $scope.refeshTable = function(){

        $http({
            method: 'GET',
            url: 'api/get_inclusionesEstudiante'
        }).then(function(response){
            console.dir(response);
            $scope.resultQuery = response.data;
        }, function(error) {
            console.error(error);
        });
    }

    $scope.enviarComentario = function(){

        $http({
            method: 'POST',
            url: 'api/post_comentario',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            transformRequest: function(obj) {
                var str = [];
                for(var p in obj)
                str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
                return str.join("&");
            },
            data : { name: $scope.comentario.userName, comentario: $scope.comentario.comentario }
        }).then(function(response){
            console.dir(data);

        }, function(error) {
            console.error(error);
        });
    }
    }


    $scope.enviarInclusion = function(){

        $http({
            method: 'POST',
            url: 'api/post_inclusion',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            transformRequest: function(obj) {
                var str = [];
                for(var p in obj)
                str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
                return str.join("&");
            },
            data : { name: $scope.comentario.userName, comentario: $scope.comentario.comentario }
        }).then(function(response){
            console.dir(data);

        }, function(error) {
            console.error(error);
        });
    }
    }


});