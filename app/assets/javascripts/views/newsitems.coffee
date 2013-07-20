$(document).ready ->

  Views.Newsitems.ShowSmall = Backbone.Marionette.ItemView.extend
    template: '#newsitems_show_small-template'
    model: Models.Newsitem

  Views.Newsitems.Index = Backbone.Marionette.CompositeView.extend
    template: '#newsitems_index-template'
    itemView: Views.Newsitems.ShowSmall
