
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
    if( 'undefined' == typeof(city) ) {
      cityname = 'undefined';
    } else if ( 'string' == typeof(city) ) {
      cityname = city;
    } else {
      cityname = city.cityname;
    }
    if( 'undefined' == typeof(report.name_seo) ) {
      reportname = report;
    } else {
      reportname = report.name_seo;
    }
    return cityname + "/reports/view/" + reportname;
  };

  return {
    city: {
      newsitems_path: function( cityname ) { return "travel-to/" + cityname + "/newsitems"; }
    },
    city_path: function(cityname) { return "travel-to/" + cityname; },
    event_path: function(cityname, eventname) { return cityname + "/events/show/" + eventname; },
    gallery_path: function(galleryname) { return "http://piousbox.com/en/galleries/show/" + galleryname + "/0"; },
    partial: function(which) { return "/partials/" + which + ".html"; },
    partial_compiled: function(which) { return "/en/" + which; },    
    report_path: report_path,
    // upload_photo_path: function() { return "/photos"; }
  };
});

// @TODO this does not work for shit.
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








