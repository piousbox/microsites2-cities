
var app = angular.module('myApp');

app.factory('City', function($resource) {
  return $resource('/api/cities/travel-to/:cityname.json', { id: '@id' }, {
    list: { method: 'GET', isArray: true, url: '/api/cities.json' }, // same as query
    get: { method: 'GET', isArray: false },
    create: { method: 'POST' }, // same as save
    create_newsitem: { method: 'POST', isArray: false, url: '/api/cities/travel-to/:cityname/newsitems.json' },
    update: { method: 'PUT' },
    feature: { method: 'GET', isArray: true, url: '/api/cities/feature.json' }
  });
});

app.factory('Meta', function() {
  var title = 'Travel Guide Mobi';
  var description = 'The travel guide to major cities in the world.';
  var author = "Victor Piousbox";
  var keywords = "Travel Guide Mobi";

  return {
    title: function() { return title; },
    setTitle: function(t) { title = t; },
    description: function() { return description; },
    setDescription: function(d) { description = d; },
    keywords: function() { return keywords; },
    setKeywords: function(k) { keywords = k; },
    author: function() { return author; },
    pretty_date: function( inn ) { return inn.substr(0,10); }
  };
});

app.factory('Newsitem', function($resource) {
  return $resource('/api/cities/travel-to/:cityname/newsitems.json', { cityname: '@cityname' }, {
    create: { method: 'POST', url: '/api/newsitems.json' },
    list: { method: 'GET', isArray: true }
  });
});

app.factory('PathHelper', function() {
  var report_path = function(report, city) {
    cityname = ( 'undefined' == typeof(city) ) ? 'undefined' : city.cityname;
    return "/en/cities/travel-to/" + cityname + "/reports/view/" + report.name_seo;
  };

  return {
    city: {
      newsitems_path: function( city ) { return "travel-to/" + city.cityname + "/newsitems"; }
    },
    city_path: function(city) { return "travel-to/" + city.cityname; },
    partial: function(which) { return "/partials/" + which + ".html"; },
    event_path: function(which) { return "/en/events/show/" + which.name_seo; },
    report_path: report_path,
    gallery_path: function(g) { return "http://piousbox.com/en/galleries/show/" + g.galleryname + "/0"; },
    upload_photo_path: function() { return "/photos"; }
  };
});

app.factory('Photo', function($resource) {
  return $resource('/api/photos.json', {}, {
    create: { method: 'POST' }
  });
});

app.factory('Report', function($resource) {
  return $resource('/api/reports/view/:name_seo.json', { name_seo: '@name_seo' }, {
    list: { method: 'GET', isArray: true, url: '/api/reports.json' },
    get: { method: 'GET', isArray: false }
  });
});

//
// Router is PathHelper
//








