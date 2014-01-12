'use strict';

var myApp = angular.module('myApp.controllers', []);

myApp.controller('ReportsIndexCtrl', [ '$scope', 'Report', function($scope, Report) {
  $scope.reports = Report.list();

}]);

myApp.controller('ReportsShowCtrl', [ '$scope', 'Report', '$routeParams', 'Meta', function($scope, Report, $routeParams, Meta) {
  $scope.Meta = Meta;
  $scope.report = Report.get({ name_seo: $routeParams.name_seo }, function(r, headers) {
    $scope.Meta.setTitle( $scope.report.name );
    $scope.Meta.setDescription( $scope.report.subtitle || $scope.report.descr.substr(0,200) );
    $scope.Meta.setKeywords( $scope.report.name );
  });
  
}]);