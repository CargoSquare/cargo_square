angular.module('app.controllers', [])

.controller('WelcomeCtrl', function ($scope) {
	$scope.tester = "test";
})

.controller('AboutCtrl', function ($scope) {
	$scope.schema = {
		type: "object",
		properties: {
			name: { type: "string", minLength: 2, title: "Name", description: "Name or alias" },
			title: {
				type: "string",
				enum: ['dr','jr','sir','mrs','mr','NaN','dj']
			}
		}
	};

	$scope.form = [
	"*",
	{
		type: "submit",
		title: "Save"
	}
	];

	$scope.model = {};

	// $scope.scopes = {
	// 	'f1': $scope.$new(true),
	// 	'f2': $scope.$new(true)
	// };

	$scope.scopes = {
		'f1': {},
		'f2': {}
	};

	$scope.scopes['f1'].schema = angular.copy($scope.schema);
	$scope.scopes['f1'].form = angular.copy($scope.form);
	$scope.scopes['f1'].model = {};

	$scope.scopes['f2'].schema = angular.copy($scope.schema);
	$scope.scopes['f2'].form = angular.copy($scope.form);
	$scope.scopes['f2'].model = {};


	// local functions
	$scope.onSubmit = function (form) {
		console.log(form);
		$scope.$broadcast('schemaFormValidate', form.$name);
	};
})
;