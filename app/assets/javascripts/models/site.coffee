$(document).ready ->

  Models.Site = Backbone.Model.extend
    url: ->
      return '/en/sites/travel-guide.mobi.json'
        
    initialize: (item) ->
      a = 'a'