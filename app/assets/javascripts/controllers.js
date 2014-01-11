'use strict';

/* Controllers */

angular.module('myApp.controllers', []).
  controller('CitiesCtrl', ['$scope', 'City', function($scope, City) {    

  }]).
  controller('CitiesIndexCtrl', ['$scope', 'City', 'Router', function($scope, City, Router) {
    $scope.cities = City.list();
    $scope.router = Router;

  }]).
  controller('CitiesProfileCtrl', ['$scope', 'City', '$routeParams', 'Router', 'Newsitem', function($scope, City, $routeParams, Router, Newsitem) {

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
    $scope.router = Router;    
    $scope.create_newsitem = function(newsitem) {
      var result = Newsitem.create({ cityname: $scope.city.cityname, newsitem: newsitem}, function(newsitem) {
        $scope.newsitems = Newsitem.list({ cityname: $scope.city.cityname });
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

