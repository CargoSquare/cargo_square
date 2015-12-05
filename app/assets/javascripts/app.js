// main app
angular.module('app', ['app.controllers', 'app.directives', 'app.services',
 'templates', 'ui.router', 'ui.bootstrap'])

.config(function($stateProvider, $urlRouterProvider) {
  // For any unmatched url, redirect to root
  $urlRouterProvider.otherwise("/");  

  $stateProvider
    .state('welcome', {
      url: "/",
      views: {
        "nav": { templateUrl: "assets/shared/nav.html", controller: 'NavCtrl' },
        "body": { templateUrl: "assets/welcome.html" }
      }
    })
    .state('about', {
      url: "/about",
      views: {
        "nav": { templateUrl: "assets/shared/nav.html", controller: 'NavCtrl' },
        "body": { templateUrl: "assets/about_us.html" }
      }
    })
    ;

})


;
