
var app = angular.module('myApp');

// var CreditCard = $resource( '/user/:userId/card/:cardId',
//   {userId:123, cardId:'@id'}, {
//   charge: {method:'POST', params:{charge:true}}
// });

// var City = $resource( '/api/cities/:cityId', { cityId: '@id' } );
// City.get({ cityId: 123, func

/*
app.factory('Folders', function($resource) {
  return $resource('/folders/:id', { id: '@id' }, {
    list: { method: 'GET' , isArray: true }, //same as query
    create: { method: 'POST' }, // same as save
    update: { method: 'PUT' }
    // DEFAULT IMPLEMENTATION OF $RESOURCE
    //   'get':    {method:'GET'},
    //   'save':   {method:'POST'},
    //   'query':  {method:'GET', isArray:true},
    //   'remove': {method:'DELETE'},
    //   'delete': {method:'DELETE'}
  });
});
*/

app.factory('City', function($resource) {
  return $resource('/api/cities/travel-to/:cityname.json', { id: '@id' }, {
    list: { method: 'GET', isArray: true, url: '/api/cities.json' }, // same as query
    get: { method: 'GET', isArray: false },
    create: { method: 'POST' }, // same as save
    create_newsitem: { method: 'POST', url: '/api/newsitems.json' },
    update: { method: 'PUT' },
    feature: { method: 'GET', isArray: true, url: '/api/cities/feature.json' }
  });
});

app.factory('Report', function($resource) {
  return $resource('/api/reports/view/:name_seo.json', { name_seo: '@name_seo' }, {
    list: { method: 'GET', isArray: true, url: '/api/reports.json' },
    get: { method: 'GET', isArray: false }
  });
});

app.factory('Newsitem', function($resource) {
  return $resource('/api/newsitems.json', {}, {
    list: { method: 'GET', isArray: true }
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








