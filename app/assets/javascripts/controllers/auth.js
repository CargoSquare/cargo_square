var root = this;

angular.module('app.controllers')

.controller('AuthLoginCtrl', function ($scope, loginService) {
	$scope.email = "";
	$scope.password = "";
	$scope.remember = false;
	
	$scope.login = function($event) {
		$event.preventDefault();

		loginService({
			email: $scope.email,
			password: $scope.password
		})
	};
	
})

;