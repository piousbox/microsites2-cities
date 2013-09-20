$(document).ready ->

  Views.City.Map = Backbone.Marionette.ItemView.extend
    model: Models.City
    template: '#city_map-template'

  Views.City.Show = Backbone.Marionette.ItemView.extend
    model: Models.City
    template: '#city_show-template'

  Views.City.LeftMenu = Backbone.Marionette.ItemView.extend
    model: Models.City
    template: '#city_left_menu-template'

  Views.City.RightMenu = Backbone.Marionette.ItemView.extend
    model: Models.City
    template: '#city_right_menu-template'


