angular.module('app.controllers', [])

.controller('DashOrderStateCtrl', function ($scope, $auth) {
	// local variables

	// filter states
	$scope.filter = {
		statuses: {
			0: "대기중",
			1: "배차중",
			2: "이동중",
			3: "상차중",
			4: "운송중",
			5: "하차중",
			6: "운송완료",
			7: "마감완료"
		}
	};

	// test data
	$scope.orders = [
		{
			status: 0,
			pickupDuedate: new Date(),
			dropoffDuedate: new Date().setDate(new Date().getDate() + 1)
		},
		{
			status: 1,
			pickupDuedate: new Date(),
			dropoffDuedate: new Date().setDate(new Date().getDate() + 1)
		},
		{
			status: 2,
			pickupDuedate: new Date(),
			dropoffDuedate: new Date().setDate(new Date().getDate() + 1)
		},
		{
			status: 3,
			pickupDuedate: new Date(),
			dropoffDuedate: new Date().setDate(new Date().getDate() + 1)
		},
		{
			status: 4,
			pickupDuedate: new Date(),
			dropoffDuedate: new Date().setDate(new Date().getDate() + 1)
		},
		{
			status: 5,
			pickupDuedate: new Date(),
			dropoffDuedate: new Date().setDate(new Date().getDate() + 1)
		},
		{
			status: 6,
			pickupDuedate: new Date(),
			dropoffDuedate: new Date().setDate(new Date().getDate() + 1)
		},
	];
})

;
