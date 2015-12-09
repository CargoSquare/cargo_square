angular.module('app.services', [])

.factory('loginService', ['$auth', '$state', function ($auth, $state) {
	return function (query) {
		$auth.submitLogin(query)
			.then(function (resp) {
				console.log("login service: successfully login!");
				$state.go('welcome');
			})
			.catch(function (resp) {
				// TODO: Error handling
				console.log("login service: Error => " + JSON.stringfy(resp));
			})
	}
}])

.factory('logoutService', ['$auth', '$state', function ($auth, $state) {
	return function () {
		$auth.signOut()
		.then(function (resp) {
			// move to home
			console.log("logout service: successfully logout!");
			$state.go('welcome');
		})
		.catch(function (resp) {
			// TODO: Error handling
			console.log("logout service: Error => " + JSON.stringfy(resp));
		});
	}
}])
;

