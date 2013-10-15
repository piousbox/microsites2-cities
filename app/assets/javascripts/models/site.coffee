$(document).ready ->

  Models.Site = Backbone.Model.extend
    url: ->
      return '/en/sites/travel-guide.mobi.json'
        
    initialize: (item) ->
      a = 'a'

  Collections.SiteGalleries = Backbone.Collection.extend
    url: ->
      return U.lang + '/sites/travel-guide.mobi/galleries.json'

    initialize: (item) ->
      console.log( 'collections.siteGalleries#initialize' )

