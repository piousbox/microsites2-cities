$(document).ready ->

  Models.Feature = Backbone.Model.extend
    url: ->
      return '/'

  Collections.Features = Backbone.Collection.extend  
    model: Models.Feature
    
    url: ->
      return "/en/features.json"

      