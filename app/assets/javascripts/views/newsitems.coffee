$(document).ready ->

  Views.Newsitems.ShowSmall = Backbone.Marionette.ItemView.extend
    template: '#newsitems_show_small-template'
    model: Models.Newsitem

    events:
      'click a.gallery-link': 'show_gallery'

    initialize: (nothing) ->
      _.bindAll @, 'show_gallery'

    show_gallery: (item) ->
      U.views.city.show.show_gallery( item )

  Views.Newsitems.Index = Backbone.Marionette.CollectionView.extend
    itemView: Views.Newsitems.ShowSmall

    initialize: (item) ->
      this.collection = item.collection # U.models.newsitems
