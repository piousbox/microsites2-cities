'use strict';

/* Controllers */
var myApp = angular.module('myApp.controllers', []);

myApp.controller('MetaHomeCtrl', ['$scope', '$interval', 'City', 'Meta', 'Newsitem', function($scope, $interval, City, Meta, Newsitem) {
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
  
}]);

myApp.controller('UsersMeetCtrl', ['$scope', 'City', function($scope, City) {
  $scope.smth = '/partials/users/meet.html';
  $scope.cities = City.feature();
  
}]);

myApp.controller('MetaCtrl', ['$scope', 'Meta', function($scope, Meta) {
  $scope.footer_partial_url = '/partials/meta/main-footer.html';
  $scope.Meta = Meta;

}]);

