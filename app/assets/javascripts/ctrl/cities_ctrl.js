'use strict';

/* Controllers */
var myApp = angular.module('myApp.controllers');

myApp.controller('CitiesNewsitemsCtrl', ['$scope', 'City', 'Newsitem', 'PathHelper', '$routeParams', function(
                                          $scope,   City,   Newsitem,   PathHelper,   $routeParams) {
  $scope.cities = City.list();

  $scope.city = City.get({ cityname: $routeParams.cityname }, function() {
    $scope.cityname = $scope.city.cityname;
    $scope.newsitems = Newsitem.list({ cityname: $scope.cityname });

  });
  $scope.update = function() {
    $scope.city = City.get({ cityname: $scope.cityname }, function() {
     $scope.newsitems = Newsitem.list({ cityname: $scope.city.cityname });
    });

  };
  $scope.create_newsitem = function(newsitem) {
    Newsitem.create({ cityname: $scope.city.cityname, newsitem: newsitem}, function() {
      // console.log( 'done created' );
      $scope.update();
    });

  };

}]);

myApp.controller('CitiesIndexCtrl', ['$scope', 'City', 'PathHelper', function(
                                      $scope,   City,   PathHelper) {
  $scope.cities = City.list();
  $scope.router = PathHelper;
  CanvasOps.homepage_all_cities();

}]);

myApp.controller('CitiesProfileCtrl', ['$scope', 'City', '$routeParams', 'PathHelper', 'Newsitem', function(
                                        $scope,   City,   $routeParams,   PathHelper,   Newsitem) {

  $scope.city = City.get({ cityname: $routeParams.cityname }, function(city) {
    // map
    var map, myOptions;
    myOptions = {
      center: new google.maps.LatLng( city.x, city.y),
      zoom: 10,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("cities_show_canvas"), myOptions);
    
    // newsitems
    $scope.newsitems = city.newsitems;
    
  });
  
  $scope.router = PathHelper;    
  $scope.create_newsitem = function(newsitem) {
    Newsitem.create({ cityname: $scope.city.cityname, newsitem: newsitem}, function(newsitem) {
      $scope.newsitems = [];
    });
  };
  
  /**
   return $.each(data, function(idx, val) {
   var infowindow, marker;
   marker = new google.maps.Marker({
   position: new google.maps.LatLng(val['x'], val['y']),
   title: val['name']
   });
   marker.setMap(map);
   infowindow = new google.maps.InfoWindow({
   content: '<a href="cities/travel-to/' + val['cityname'] + '">' + val['name'] + '</a>'
   });
   return google.maps.event.addListener(marker, 'click', function() {
   return infowindow.open(map, marker);
   });
   });
   };
   */
  
}]);

myApp.controller('ReportsIndexCtrl', [ '$scope', 'Report', function($scope, Report) {
  $scope.reports = Report.list();

}]);

myApp.controller('ReportsShowCtrl', [ '$scope', 'Report', '$routeParams', 'Meta', function(
                                       $scope,   Report,   $routeParams,   Meta) {
  $scope.Meta = Meta;
  $scope.report = Report.get({ name_seo: $routeParams.name_seo }, function(r, headers) {
    $scope.Meta.setTitle( $scope.report.name );
    $scope.Meta.setDescription( $scope.report.subtitle || $scope.report.descr.substr(0,200) );
    $scope.Meta.setKeywords( $scope.report.name );
  });
  
}]);

myApp.controller('SitesHomeCtrl', ['$scope', '$interval', 'City', 'Meta', 'Newsitem', function($scope, $interval, City, Meta, Newsitem) {
  $scope.Meta = Meta;
  CanvasOps.homepage_all_cities();
  $scope.feature_cities = City.feature();
  $scope.cities = City.list();
  $scope.newsitems = Newsitem.list();
  
}]);
  
myApp.controller('UsersMeetCtrl', ['$scope', 'City', function($scope, City) {
  $scope.smth = '/partials/users/meet.html';
  $scope.cities = City.feature();
  
}]);

myApp.controller('MetaCtrl', ['$scope', 'Meta', function($scope, Meta) {
  $scope.footer_partial_url = '/partials/meta/main-footer.html';
  $scope.Meta = Meta;
  
}]);

