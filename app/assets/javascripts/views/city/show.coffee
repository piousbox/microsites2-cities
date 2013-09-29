$(document).ready ->

  Views.City.Map = Backbone.Marionette.ItemView.extend
    model: Models.City
    template: '#city_map-template'

  Views.City.Show = Backbone.Marionette.ItemView.extend
    model: Models.City
    template: '#city_show-template'
    events:
      'click a.event-link': 'show_event'
      'click a.report-link': 'show_report'
      'click a.gallery-link': 'show_gallery'

    initialize: (item) ->
      # console.log( 'init city show ' + item )
      # @model = U.models.city
      _.bindAll @, 'show_event', 'show_report', 'show_gallery'
      @on('render', @afterRender)

    afterRender: ->
      ad_content = $('.ad-large-rectangle')[0].innerHTML
      this.$el.append( ad_content )

    show_event: (item) ->
      # console.log( 'showing event ' + item.currentTarget.attributes.name_seo.value )
      eventname = item.currentTarget.attributes.name_seo.value
      U.models.event = new Models.Event({ eventname: eventname })
      U.views.event = new Views.Events.Show({ model: U.models.event })
      U.models.event.fetch
        success: ->
          MyApp.left_region.show( U.views.event )
        
    show_report: (item) ->
      name_seo = item.currentTarget.attributes.name_seo.value
      console.log( 'showing report ' + name_seo )
      U.models.report = new Models.Report({ name_seo: name_seo })
      U.views.report = new Views.Report.Show({ model: U.models.report })
      U.models.report.fetch
        success: ->
          MyApp.left_region.show( U.views.report )

    show_gallery: (item) ->
      a = 'a'
      name_seo = item.currentTarget.attributes.galleryname.value
      U.models.gallery = new Models.Gallery({ galleryname: name_seo })
      U.views.gallery = new Views.Gallery.Show({ model: U.models.gallery })
      U.models.gallery.fetch
        success: ->
          MyApp.left_region.show( U.views.gallery )

  Views.City.LeftMenu = Backbone.Marionette.ItemView.extend
    model: Models.City
    template: '#city_left_menu-template'

  Views.City.RightMenu = Backbone.Marionette.ItemView.extend
    model: Models.City
    template: '#city_right_menu-template'


