angular.module('app.controllers')

.controller('NavCtrl', function ($scope, $state) {
	$scope.states = [{
		state: "about",
		name: "about us",
		link: "about",
		hasChildren: false
	}, {
		name: "test",
		link: false,
		hasChildren: true,
		childrens: [{
			state: "test.child1",
			name: "child1",
			link: "welcome"
		}, {
			divider: true
		}, {
			state: "test.child2",
			name: "child2",
			link: "welcome"
		}]
	}, {
		state: "auth.login",
		name: "login",
		link: "auth.login",
	}];

	$scope.currState = $state.current.name;
})

;