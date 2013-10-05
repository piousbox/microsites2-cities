$(document).ready ->
 
  Views.Cities.Home = Backbone.Marionette.ItemView.extend
    template: '#cities_home-template'

    events:
      'click .report-link': 'show_report' # U.views.city.show.show_report

    initialize: (options) ->
      _.bindAll @, "afterRender", 'show_report'
      # @on('render', @afterRender)

      @model = options.model        

    afterRender: ->
      ad_content = $('.ad-large-rectangle')[0].innerHTML
      this.$el.append( ad_content )

    show_report: (item) ->
      name_seo = item.currentTarget.attributes.name_seo.value
      U.models.report = new Models.Report({ name_seo: name_seo })
      U.views.report = new Views.Report.Show({ model: U.models.report })
      U.models.report.fetch
        success: ->
          MyApp.left_region.show( U.views.report )

  Views.Cities.IndexItem = Backbone.Marionette.ItemView.extend
    model: Models.City
    template: '#cities_index_item-template'

  Views.Cities.Index = Backbone.Marionette.CollectionView.extend
    template: '#cities_index-template'
    itemView: Views.Cities.IndexItem
    sanity: true

    events:
      'click a.city-link': 'show_city'

    initialize: (item) ->
      this.collection = U.models.cities
      @on('render', @afterRender)

    afterRender: ->
      ad_content = $('.ad-large-rectangle')[0].innerHTML
      this.$el.append( ad_content )

    show_city: (item) ->
      U.models.city = new Models.City({ cityname: item.currentTarget.attributes.cityname.value })
      U.models.city.fetch
        success: ->
          U.views.city.show = new Views.City.Show({ model: U.models.city })
          # U.views.city.left_menu = new Views.City.LeftMenu
          MyApp.right_region.show( U.views.city.show )
          # U.views.city.show.show_map()
          # MyApp.left_menu.show( U.views.city.left_menu )

  Views.Cities.Map = Backbone.Marionette.ItemView.extend
    template: '#cities_map-template'
    sanity: true

    events:
      'click a.city_link': 'show_city'
    
    initialize: (item) ->
      _.bindAll this, 'show_map'
      @model = item.model
      @model.fetch
        success: ->
          U.views.cities.map.show_map()

    show_map: ( nothing ) ->
      myOptions =
        zoom: 3
        center: new google.maps.LatLng(15.623037,-84.931644)
        mapTypeId: google.maps.MapTypeId.ROADMAP

      map = new google.maps.Map(document.getElementById("cities_index_canvas"), myOptions)

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
        
    show_city: (item) ->
      U.views.cities.index.show_city( item )
      # console.log item.currentTarget.attributes.cityname
      # U.models.city = new Models.City({ cityname: item.cityname })
      # U.models.city.fetch
      #   success: ->
      #     U.views.city = new Views.City.Show
      #       model: U.models.city
      #     U.views.city.left_menu = new Views.City.LeftMenu
      #     MyApp.right_region.show( U.views.city )
      #     MyApp.left_menu.show( U.views.city.left_menu )

    show_map_venue: (agrs) ->
      myOptions =
        zoom: 12
        center: new google.maps.LatLng( @model.get('x'), @model.get('y') )
        mapTypeId: google.maps.MapTypeId.ROADMAP

      U.map = new google.maps.Map(document.getElementById("cities_show_canvas"), myOptions)
      
      # data['venues']
      $.each [], (idx, val) ->
        if val["x"] isnt null and val["y"] isnt null
          myLatlng = new google.maps.LatLng(val["x"], val["y"])
          contentString = "<div class='blah blah'>" + "<h4><a href='/venues/" + val["id"] + "'>" + val["name"] + "</a></h4>" + "</div>"
          infowindow = new google.maps.InfoWindow(content: contentString)
          marker = new google.maps.Marker(
            position: myLatlng
            map: U.map
            title: val["name"]
          )
          google.maps.event.addListener marker, "click", ->
            open_infowindow.close()  if open_infowindow
            infowindow.open U.map, marker
            open_infowindow = infowindow
            
      # data['reports']
      $.each [], (key, val) ->
        if val["x"] isnt null and val["y"] isnt null
          myLatlng = new google.maps.LatLng(val["x"], val["y"])
          contentString = "<div class='blah blah'><h4><a href='/reports/"+val["id"]+"'>"+val["name"]+"</a></h4><p>"+val["subhead"]+"</p></div>"
          infowindow = new google.maps.InfoWindow(content: contentString)
          marker = new google.maps.Marker(
            position: myLatlng
            map: U.map
            title: val["name"]
          )
          google.maps.event.addListener marker, "click", ->
            open_infowindow.close()  if open_infowindow
            infowindow.open U.map, marker
            open_infowindow = infowindow
        
        
              