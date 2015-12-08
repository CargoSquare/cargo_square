// main app
angular.module('app', ['app.controllers', 'app.directives', 'app.services',
 'templates', 'ui.router', 'ui.bootstrap', 'ng-token-auth'])

// router config
.config(function($stateProvider, $urlRouterProvider) {
  // For any unmatched url, redirect to root
  $urlRouterProvider.otherwise("/");  

  $stateProvider
    .state('welcome', {
      url: "/",
      templateUrl: "assets/welcome.html"
    })
    .state('about', {
      url: "/about",
      templateUrl: "assets/about_us.html"
    })
    .state('auth', {
      url: '/auth',
      abstract: true,
      template: '<ui-view/>'
    })
    .state('auth.login', {
      url: '/',
      templateUrl: "assets/auth/login.html"
    })
    ;

})

// auth config
.config(function($authProvider) {
  $authProvider.configure({
    // for development stage
    apiUrl: 'http://localhost:3000'
  })

})

;
