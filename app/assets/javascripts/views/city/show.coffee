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
      _.bindAll @, 'show_event', 'show_report', 'show_gallery', 'show_map'
      
      @model = item.model
      @model.fetch
        success: ->
          U.views.city.show.show_map()

      @on('render', @afterRender)

    show_map: (nothing) ->
      myOptions =
        zoom: 8
        center: new google.maps.LatLng( @model.get('x'), @model.get('y') )
        mapTypeId: google.maps.MapTypeId.ROADMAP

      map = new google.maps.Map(document.getElementById("cities_show_canvas"), myOptions)

      $.each U.models.cities.models, (idx, val_raw) ->
        val = val_raw.attributes
        if val["x"] isnt null and val["y"] isnt null
          myLatlng = new google.maps.LatLng(val["x"], val["y"])
          contentString = "<div class='blah blah'><h4><a href='javascript:void(0)' class='city_link' cityname='" + val["cityname"] + "'>" + val["name"] + "</a></h4></div>"
          infowindow = new google.maps.InfoWindow(content: contentString)
          marker = new google.maps.Marker(
            position: myLatlng
            map: map
            title: val["name"]
          )
          google.maps.event.addListener marker, "click", ->
            open_infowindow.close()  if open_infowindow
            infowindow.open map, marker
            open_infowindow = infowindow

    afterRender: ->
      ad_content = $('.ad-large-rectangle')[0].innerHTML
      this.$el.append( ad_content )
      # this.show_map()

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


