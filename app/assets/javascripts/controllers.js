'use strict';

/* Controllers */
var myApp = angular.module('myApp.controllers', []);

myApp.controller('MetaHomeCtrl', ['$scope', '$interval', 'City', 'Meta', 'Newsitem', function($scope, $interval, City, Meta, Newsitem) {
  
  var create_newsitem = function(newsitem) {
    var result = City.create_newsitem( newsitem, function(n) {
      $scope.newsitems = Newsitem.list();
    });
  };
  CanvasOps.homepage_all_cities();
  $scope.feature_cities = City.feature();
  $scope.cities = City.list();
  $scope.newsitems = Newsitem.list();
  $scope.create_newsitem = create_newsitem;
  
}]);

myApp.controller('UsersMeetCtrl', ['$scope', 'City', function($scope, City) {
  $scope.cities = City.feature();
  
}]);

myApp.controller('MetaCtrl', ['$scope', 'Meta', 'PathHelper', function($scope, Meta, PathHelper) {
  
  CanvasOps.homepage_all_cities();

  $scope.footer_partial_url = '/partials/meta/main-footer.html';
  $scope.Meta = Meta;
  $scope.router = PathHelper;

}]);

myApp.controller('PhotosNewCtrl', ['$scope', 'Photo', function($scope, Photo) {
  $scope.create = function(photo) {
    Photo.create( photo );
  };
  
}]);

myApp.controller('BreadcrumbsCtrl', ['$scope', 'PathHelper', '$routeParams', function(
                                      $scope,   PathHelper,   $routeParams) {
  var breadcrumbs = [
    { link_path: '/en/cities', link_name: 'Home' },
    { link_path: '/en/cities/travel-to', link_name: 'Cities' }
  ];
  var cityname = $routeParams.cityname;
  var name_seo = $routeParams.name_seo;
  if ( 'undefined' != typeof(cityname) ) {
    breadcrumbs.push({ link_path: PathHelper.city_path(cityname), link_name: cityname });
  }
  if ( 'undefined' != typeof(name_seo) ) {
    breadcrumbs.push({ link_path: PathHelper.city.reports_path(cityname), link_name: 'Reports' });
    breadcrumbs.push({ link_path: PathHelper.city.report_path(cityname, name_seo), link_name: name_seo });
  }
  $scope.breadcrumbs = breadcrumbs;
  $scope.router = PathHelper;

}]);
