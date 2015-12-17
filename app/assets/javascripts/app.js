// main app
angular.module('app', ['app.controllers', 'app.directives', 'app.services',
 'templates', 'ui.router', 'ui.bootstrap', 'ng-token-auth', 'schemaForm'])

// router config
.config(function($stateProvider, $urlRouterProvider) {
  // For any unmatched url, redirect to root
  $urlRouterProvider.otherwise("/");  

  $stateProvider
    .state('welcome', {
      url: "/",
      controller: function($scope, $state, $auth) {
        $auth.validateUser()
          .then(function (user) {
            $state.go('dash.dashboard');
          })
          .catch(function (error) {
            $state.go('auth.login');
          });
      }
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
    .state('dash', {
      url: '/dash',
      abstract: true,
      templateUrl: "assets/dash/base.html"
    })
    .state('dash.dashboard', {
      url: '/',
      templateUrl: "assets/welcome.html",
      controller: function($scope, $state, $auth) {
        
      }
    })
    .state('dash.order', {
      url: '/order',
      abstract: true,
      template: '<ui-view/>'
    })
    .state('dash.order.state', {
      url: "/state",
      templateUrl: "assets/dash/order-state.html",
      controller: "DashOrderStateCtrl"
    })
    .state('dash.order.new', {
      url: "/new",
      templateUrl: "assets/dash/order-new.html"
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
