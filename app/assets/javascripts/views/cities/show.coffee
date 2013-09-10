$(document).ready ->

  Views.Cities.Show = Backbone.Marionette.ItemView.extend
    model: Models.City
    template: '#cities_show-template'
    
  Views.City.IndexLeftMenu = Backbone.Marionette.ItemView.extend
    model: Models.City
    template: '#city_index_left_menu-template'
    
