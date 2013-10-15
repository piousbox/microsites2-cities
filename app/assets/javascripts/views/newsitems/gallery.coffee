$(document).ready ->

  Views.Newsitems.Gallery = Backbone.Marionette.ItemView.extend
    template: '#newsitems_gallery-template'
    model: Models.Gallery
