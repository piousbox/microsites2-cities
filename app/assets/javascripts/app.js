'use strict';

// Declare app level module which depends on filters, and services
angular.module('myApp', [
  'ngRoute',
  'ngResource',
  'ngSanitize',
  'myApp.filters',
  'myApp.services',
  'myApp.directives',
  'myApp.controllers'
]).
config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/', {templateUrl: '/partials/meta/home.html', controller: 'MetaHomeCtrl'});

  $routeProvider.when('/travel-to', {templateUrl: '/partials/cities/index.html', controller: 'CitiesIndexCtrl'});
  $routeProvider.when('/travel-to/:cityname', {templateUrl: '/partials/cities/show.html', controller: 'CitiesProfileCtrl'});
  $routeProvider.when('/travel-to/:cityname/newsitems', { templateUrl: '/partials/cities/newsitems.html' });
  $routeProvider.when('/travel-to/:cityname/reports', {templateUrl: '/partials/reports/index.html', controller: 'ReportsIndexCtrl'});
  $routeProvider.when('/travel-to/:cityname/reports/view/:name_seo', {templateUrl: '/partials/reports/show.html', controller: 'ReportsShowCtrl'});

  $routeProvider.otherwise({redirectTo: '/'});
}]).
config(['$locationProvider', function($locationProvider) {
  $locationProvider.html5Mode(true).hashPrefix('!');
}]).
config(["$httpProvider", function($httpProvider) {
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
}]);
// .config(['$httpProvider', function(provider) {
//   provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
// }]);
