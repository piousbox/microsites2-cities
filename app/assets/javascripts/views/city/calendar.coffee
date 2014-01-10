
$(document).ready ->
        
  Views.City.Calendar = Backbone.Marionette.ItemView.extend
    template: '#city_calendar-template'
    # model: Models.City
    initialize: (item) ->
      @model = item.model

