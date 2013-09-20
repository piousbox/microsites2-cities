
$(document).ready ->

  Models.Event = Backbone.Model.extend

    url: ->
      if @eventname
        return "/" + @locale + "/events/show/" + @eventname + '.json'
      else if @cityname
        return "/" + @locale + "/events/in-city/" + @cityname + ".json"
      else
        return "/" + @locale + "/events.json"

    initialize: (item) ->
      @locale = 'en'
      if item.eventname
        @eventname = item.eventname
      else if item.cityname
        @cityname = item.cityname

