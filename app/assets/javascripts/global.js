
U = {
  collections: {},
  views: {
    cities: {},
    features: {},
    galleries: {},
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
  dropbox: {},
  log: function(args) {
    console.log(args);
    $("#log_main div").append(args);
  },
  manager: {
    views: {
      galleries: {}
    }
  }
}

CanvasOps = {
    trash: 'trash'
}
Utils = {}
// header footer
HF = {}

Models = {}
Collections = {}
Views = {
  Cities: {},
  Features: {},
  Galleries: {},
  Newsitems: {},
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







