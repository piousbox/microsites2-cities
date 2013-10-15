$(document).ready ->

  Views.Newsitems.ShowSmall = Backbone.Marionette.ItemView.extend
    template: '#newsitems_show_small-template'
    model: Models.Newsitem

  Views.Newsitems.Index = Backbone.Marionette.CollectionView.extend
    itemView: Views.Newsitems.ShowSmall

    initialize: (item) ->
      this.collection = item.collection # U.models.newsitems
