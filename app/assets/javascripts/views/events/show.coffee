
$(document).ready ->

  Views.Events.Show = Backbone.Marionette.ItemView.extend
    model: Models.Event
    template: '#events_show-template'
