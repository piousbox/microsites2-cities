$(document).ready ->

  Views.City.Map = Backbone.Marionette.ItemView.extend
    model: Models.City
    template: '#city_map-template'

  Views.City.Show = Backbone.Marionette.ItemView.extend
    model: Models.City
    template: '#city_show-template'
    events:
      'click a.event-link': 'show_event'

    show_event: (item) ->
      # console.log( 'showing event ' + item.currentTarget.attributes.name_seo.value )
      eventname = item.currentTarget.attributes.name_seo.value
      U.models.event = new Models.Event({ name_seo: eventname })
      U.views.event = new Views.Events.Show({ model: U.models.event })
      MyApp.left_region.show( U.views.event )

  Views.City.LeftMenu = Backbone.Marionette.ItemView.extend
    model: Models.City
    template: '#city_left_menu-template'

  Views.City.RightMenu = Backbone.Marionette.ItemView.extend
    model: Models.City
    template: '#city_right_menu-template'


