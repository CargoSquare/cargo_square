var root = this;

angular.module('app.controllers')

.controller('AuthLoginCtrl', function ($scope, $auth, $state) {
	root.auth = $auth;
	$scope.email = "";
	$scope.password = "";
	$scope.remember = false;

	$scope.login = function($event) {
		$event.preventDefault();
		$auth.submitLogin({
			email: $scope.email,
			password: $scope.password
		}).then(function (resp) {
			console.log("success");
			console.log(resp);
		}).catch(function (resp) {
			// error handle
			console.log("error");
			console.log(resp);
		});
	};
});