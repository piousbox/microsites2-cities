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
  $routeProvider.when('/', {templateUrl: '/partials/sites/home.html', controller: 'SitesHomeCtrl'});

  $routeProvider.when('/cities', {templateUrl: '/partials/cities_index.html', controller: 'CitiesIndexCtrl'});
  $routeProvider.when('/cities/travel-to/:cityname', {templateUrl: '/partials/cities_profile.html', controller: 'CitiesProfileCtrl'});

  $routeProvider.when('/reports', {templateUrl: '/partials/reports_index.html', controller: 'ReportsIndexCtrl'});
  $routeProvider.when('/reports/view/:name_seo', {templateUrl: '/partials/reports_show.html', controller: 'ReportsShowCtrl'});

  $routeProvider.otherwise({redirectTo: '/'});
}]).
config(['$locationProvider', function($locationProvider) {
  $locationProvider.html5Mode(true).hashPrefix('!');
}]);
// .config(['$httpProvider', function(provider) {
//   provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
// }]);
