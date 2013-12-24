
U = {
  collections: {},
  views: {
    cities: {},
    city: {},
    features: {},
    newsitems: {},
    places: {},
    reports: {},
    sites: {},
    users: {},
    venues: {},
    videos: {},
    welcome: {}
  },
  models: {},
  // dropbox: {},
  locale: 'en',
  log: function(args) {
    console.log(args);
    $("#log_main div").append(args);
  },
  manager: {
    views: {
      galleries: {}
    }
  },
  pretty_date: function(x) { return x.substring(0,10) }
}

CanvasOps = {}
Utils = {}
HF = {} // header footer

Models = {}
Collections = {
  Sites: {},
  Newsitems: {}
}
Views = {
  Cities: {},
  City: {},
  Event: {},
  Events: {},
  Features: {},
  Galleries: {},
  Gallery: {},
  Newsitems: {},
  Report: {},
  Reports: {},
  Sites: {},
  Users: {},
  Venues: {},
  Videos: {}
}
Manager = {
  Collections: {},
  Views: {
    Galleries: {},
    Reports: {},
    Welcome: {}
  },
  Models: {}
}

App = {
  Models: {},
  Collections: {},
  Routers: {},
  Views: {
    Cities: {}, 
    City: {},
    Reports: {},
    Users: {},
    Venues: {},
    Videos: {}
  }
}

MyApp = new Backbone.Marionette.Application();

MyApp.addRegions({
  right_region: ".right-container .inner",
  left_region: ".left-container .inner",

  right_menu: ".right-menu",
  left_menu: ".left-menu",

  manager_menu: '.manager-menu',
  manager_region: '.manager-region'
  
});

// for wikitravel.org articles
are_ads_hidden = functin(){ return true; }




