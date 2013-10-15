$(document).ready ->

  Models.Newsitem = Backbone.Model.extend
    url: ->
      return '/'

  Collections.Newsitems.Index = Backbone.Collection.extend  
    model: Models.Newsitem
    
    url: ->
      return U.lang + '/sites/' + U.domain + '/newsitems.json'

      