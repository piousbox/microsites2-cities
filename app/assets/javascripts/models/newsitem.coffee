$(document).ready ->

  Models.Newsitem = Backbone.Model.extend
    url: ->
      return '/'

  Collections.Newsitems = Backbone.Collection.extend  
    model: Models.Newsitem
    
    url: ->
      return "/en/newsitems.json"

      