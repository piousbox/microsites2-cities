$(document).ready ->

  Views.Cities.Show = Backbone.Marionette.ItemView.extend
    model: Models.City
    template: '#cities_show-template'
