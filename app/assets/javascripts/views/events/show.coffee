
$(document).ready ->

  Views.Events.Show = Backbone.Marionette.ItemView.extend
    model: Models.Event
    template: '#events_show-template'

    initialize: ->
      @on('render', @afterRender)

    afterRender: ->
      ad_content = $('.ad-large-rectangle')[0].innerHTML
      this.$el.append( ad_content )
