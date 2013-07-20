$(document).ready ->

  Models.Newsitem = Backbone.Model.extend
    url: ->
      return "/en/newsitems.json"

  Collections.Newsitems = Backbone.Collection.extend  
    model: Models.Newsitem
    
    url: ->
      if @id
        return "/newsitems/show/" + @id + ".json"
      else
        return "/en/newsitems.json"

    initialize: ( item ) ->
      @id = item.id
      