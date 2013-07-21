$(document).ready ->

  Views.Features.ShowSmall = Backbone.Marionette.ItemView.extend
    template: '#features_show_small-template'
    model: Models.Feature

  Views.Features.Index = Backbone.Marionette.CollectionView.extend
    template: '#features_index-template'
    itemView: Views.Features.ShowSmall

    initialize: (item) ->
      this.collection = U.models.features
