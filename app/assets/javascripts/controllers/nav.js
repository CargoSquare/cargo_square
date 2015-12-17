angular.module('app.controllers')

.controller('NavCtrl', function ($scope, $state, $auth, logoutService) {

	// scope variables
	$scope.currState = $state.current.name;
	$scope.isCollapsed = true;

	// types = [ link, dropdown, button ]
	$scope.states = [
		{
			type: "link",
			state: "about",
			name: "about us",
			link: "about"
		},
		{
			type: "dropdown",
			name: "test",
			childrens: [
				{
					type: "link",
					state: "test.child1",
					name: "child1",
					link: "welcome"
				}, {
					divider: true
				}, {
					type: "link",
					state: "test.child2",
					name: "child2",
					link: "welcome"
				}
			]
		},
		{
			type: "link",
			state: "auth.login",
			name: "login",
			link: "auth.login",
		}
	];


	// auth section
	var authStateHandler = function () {
		var authState = $scope.states.filter(function (e) { return typeof(e.state) === 'string' && e.state.match(/^auth/i); })[0];

		$auth.validateUser()
			.then(function (user) {
				authState.type = "button";
				authState.state = "auth.logout";
				authState.name = "logout";
				authState.action = function() { logoutService() };
			})
			.catch(function (error) {
				authState.type = "link";
				authState.state = "auth.login";
				authState.name = "login";
				authState.link = "auth.login";
			});
	};

	// init call
	authStateHandler();

	// listeners
	$scope.$on('auth:login-success', authStateHandler);
	$scope.$on('auth:logout-success', authStateHandler);

	$scope.$on('$destroy', authStateHandler);

	
})

.controller('SideNavCtrl', function ($scope, $state, $timeout) {

	// scope variables
	$scope.currState = $state.current.name;

	// types = [ link, dropdown ]
	$scope.states = [
		{
			type: "dropdown",
			name: "오더 관리",
			state: "dash.order",
			childrens: [
				{
					type: "link",
					state: "dash.order.state",
					name: "오더 현황"
				},
				{
					type: "link",
					state: "dash.order.new",
					name: "오더 등록"
				}
			]
		},
		{
			type: "dropdown",
			name: "고객 관리",
			state: "dash.customer",
			childrens: [
				{
					type: "link",
					state: "dash.customer.clients",
					name: "고객사 관리",
				}, 
				{
					type: "link",
					state: "dash.customer.managers",
					name: "담당자 관리",
				}
			]
		},
		{
			type: "link",
			state: "dash.test",
			name: "test"
		}
	];

	// when state changes
	$scope.$on('$stateChangeSuccess', function() {
		
			$scope.currState = $state.current.name;

			angular.forEach($scope.states, function (state) {
				stateRegex = new RegExp(state.state);
				if ( stateRegex.test($scope.currState) ) {
					state.isCollapsed = false;
				}
				else {
					state.isCollapsed = true;	
				}
			});

	});
	
	
})
;