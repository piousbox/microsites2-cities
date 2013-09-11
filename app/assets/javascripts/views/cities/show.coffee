$(document).ready ->

  Views.Cities.Show = Backbone.Marionette.ItemView.extend
    model: Models.City
    template: '#cities_show-template'

  Views.City.LeftMenu = Backbone.Marionette.ItemView.extend
    model: Models.City
    template: '#city_left_menu-template'

  Views.City.RightMenu = Backbone.Marionette.ItemView.extend
    model: Models.City
    template: '#city_right_menu-template'


