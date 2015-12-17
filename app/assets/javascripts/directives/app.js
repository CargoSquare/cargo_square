angular.module('app.directives', [])

.directive("orderAction", function() {
	return {
		template: '<button type="button" class="btn {{ btnClass }}"> {{ btnText }} </button>',
		scope: { 
			status: '@'
		},
		link: function (scope, element, attrs) {
			switch(scope.status) {
				case '0':
					scope.btnClass = "btn-default";
					scope.btnText = "오더 등록";
					break;
				case '1':
					scope.btnClass = "btn-primary";
					scope.btnText = "배차 등록";
					break;
				case '2':
					scope.btnClass = "btn-info";
					scope.btnText = "현황 보기";
					break;
				case '3':
					scope.btnClass = "btn-success";
					scope.btnText = "현황 보기";
					break;
				case '4':
					scope.btnClass = "btn-warning";
					scope.btnText = "현황 보기";
					break;
				case '5':
					scope.btnClass = "btn-danger";
					scope.btnText = "현황 보기";
					break;
				case '6':
					scope.btnClass = "btn-primary";
					scope.btnText = "현황 보기";
					break;
				default:
					scope.btnClass = "btn-default";
					scope.btnText = "현황 보기";
			}

		}
	}
})

;