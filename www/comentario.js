pp = angular.module('incursionApp', []);


app.controller('comentarioController', function($scope, $http){


    
    $scope.comentario = {
        "userName": "",
        "comentario": ""

    };

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

});