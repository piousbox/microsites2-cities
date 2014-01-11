'use strict';

/* Controllers */

angular.module('myApp.controllers', []).
  controller('CitiesCtrl', ['$scope', 'City', function($scope, City) {    

  }]).
  controller('CitiesIndexCtrl', ['$scope', 'City', 'Router', function($scope, City, Router) {
    $scope.cities = City.list();
    $scope.router = Router;

  }]).
  controller('CitiesProfileCtrl', ['$scope', 'City', '$routeParams', function($scope, City, $routeParams) {
    $scope.city = City.get({ cityname: $routeParams.cityname }, function() {
      console.log( $scope.city.j_users[0] );
    });

  }]).
  controller('ReportsIndexCtrl', [ '$scope', 'Report', function($scope, Report) {
    $scope.reports = Report.list();

  }]).

  controller('ReportsShowCtrl', [ '$scope', 'Report', '$routeParams', 'Meta', function($scope, Report, $routeParams, Meta) {
    $scope.Meta = Meta;
    $scope.report = Report.get({ name_seo: $routeParams.name_seo }, function(r, headers) {
      $scope.Meta.setTitle( $scope.report.name );
      $scope.Meta.setDescription( $scope.report.subtitle || $scope.report.descr.substr(0,200) );
      $scope.Meta.setKeywords( $scope.report.name );
    });

  }]).

  controller('SitesHomeCtrl', ['$scope', '$interval', 'City', 'Meta', 'Newsitem', function($scope, $interval, City, Meta, Newsitem) {
    $scope.Meta = Meta;
    CanvasOps.homepage_all_cities();
    $scope.feature_cities = City.feature();
    $scope.cities = City.list();
    $scope.newsitems = Newsitem.list();
    $scope.create_newsitem = function(newsitem) {
      var result = City.create_newsitem( newsitem, function(n) {
        $scope.newsitems = Newsitem.list();
      });
    };

  }]).

  controller('UsersMeetCtrl', ['$scope', 'City', function($scope, City) {
    $scope.smth = '/partials/users/meet.html';
    $scope.cities = City.feature();
  
  }]).

  controller('MetaCtrl', ['$scope', 'Meta', function($scope, Meta) {
    $scope.footer_partial_url = '/partials/meta/main-footer.html';
    $scope.Meta = Meta;

  }]);

