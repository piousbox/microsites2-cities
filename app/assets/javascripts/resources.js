
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

app.factory('Newsitem', function($resource) {
  return $resource('/api/newsitems.json', {}, {
    create: { method: 'POST' },
    list: { method: 'GET', isArray: true, url: '/api/cities/travel-to/:cityname/newsitems.json' }
  });
});

app.factory('Report', function($resource) {
  return $resource('/api/reports/view/:name_seo.json', { name_seo: '@name_seo' }, {
    list: { method: 'GET', isArray: true, url: '/api/reports.json' },
    get: { method: 'GET', isArray: false }
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

app.factory('Router', function() {
  return {
    city_path: function(city) { return "travel-to/" + city.cityname; },
    partial: function(which) { return "/partials/" + which + ".html"; },
    event_path: function(which) { return "/en/events/show/" + which.name_seo; },
    report_path: function(r) { return "/en/reports/view/" + r.name_seo; },
    gallery_path: function(g) { return "http://piousbox.com/en/galleries/show/" + g.galleryname + "/0"; }
  };
});








