$(document).ready ->

  # Views.Cities.Galleries = Backbone.View.extend      
    
  Views.Cities.Calendar = Backbone.Marionette.ItemView.extend
    template: '#city_calendar-template'
    # model: Models.City
    initialize: (item) ->
      @model = item.model

  Views.Cities.Home = Backbone.Marionette.ItemView.extend
    template: '#cities_index-template'
    # model: Models.City

    initialize: (item) ->
      @model = item.model

    onRender: ->
      # put an ad there.
      $('.right-container .inner').ready ->
        ad = $('.ad-large-rectangle').html()
        $('.right-container .inner .home-ad').append( ad )

  Views.Cities.LeftMenu = Backbone.Marionette.ItemView.extend
    template: '#left_menu-template'
    # model: Models.City

    events:
      'click a.map_link': 'show_map'
      'click a.calendar_link': 'show_calendar'

    initialize: (item) ->
      @model = item.model
      _.bindAll @, 'deactivate_all', 'show_map', 'show_calendar'

    show_map: (item) ->
      @deactivate_all()
      $(item.currentTarget).addClass('active')
      U.models.city.fetch
        success: ->
          MyApp.left_region.show new Views.Cities.Map
            model: U.models.city

    show_calendar: (item) ->
      @deactivate_all()
      $(item.currentTarget).addClass('active')
      U.models.city.fetch
        success: ->
          MyApp.left_region.show new Views.Cities.Calendar
            model: U.models.city

    deactivate_all: (item) ->
      while $(".left-menu ul li a.active").length > 0
        _.each $(".left-menu ul li a.active"), (key, value) ->
          item = $(".left-menu ul li a.active").eq(value)
          item.removeClass('active')

  Views.Cities.RightMenu = Backbone.Marionette.ItemView.extend
    template: '#right_menu-template'
    # I think this is unnecessary if I set the @model in the initializer?
    # model: Models.City
    events:
      'click a.reports_link': 'show_reports'
      'click a.places_link': 'show_venues'
      'click li.galleries_link a': 'show_galleries'
      'click a.videos_link': 'show_videos'
      'click a.users_link': 'show_users'

    initialize: (item) ->
      @model = item.model
      _.bindAll @, 'show_reports', 'show_venues', 'show_galleries', 'show_videos', 'show_users', 'deactivate_all', 'finish_rendering'

    finish_rendering: ->
      if '0' == @model.get('n_galleries').toString()
        $(".galleries-link").css('display', 'none')
        
    show_reports: (item) ->
      @deactivate_all()
      $(item.currentTarget).addClass('active')
      U.models.reports.fetch
        success: ->
          MyApp.right_region.show new Views.Reports.Index
            collection: U.models.reports

    show_venues: (item) ->
      @deactivate_all()
      $(item.currentTarget).addClass('active')
      U.models.venues.fetch
        success: ->
          MyApp.right_region.show new Views.Venues.Index
            collection: U.models.venues

    show_galleries: (item) ->
      @deactivate_all()
      $(item.currentTarget).addClass('active')
      U.models.galleries.fetch
        success: ->
          MyApp.right_region.show new Views.Galleries.Index
            collection: U.models.galleries

    show_videos: (item) ->
      @deactivate_all()
      $(item.currentTarget).addClass('active')
      U.models.videos.fetch
        success: ->
          MyApp.right_region.show new Views.Videos.Index
            collection: U.models.videos

    show_users: (item) ->
      @deactivate_all()
      $(item.currentTarget).addClass('active')
      U.models.users.fetch
        success: ->
          MyApp.right_region.show new Views.Users.Index
            collection: U.models.users

    deactivate_all: (item) ->
      while $(".right-menu ul li a.active").length > 0
        _.each $(".right-menu ul li a.active"), (key, value) ->
          item = $(".right-menu ul li a.active").eq(value)
          item.removeClass('active')

  Views.Cities.RightMenu = Backbone.Marionette.ItemView.extend
    template: '#cities_index_right_menu-template'
    # I think this is unnecessary if I set the @model in the initializer?
    # model: Models.City
    events:
      'click li.newsitems-link a': 'show_newsitems'
      'click li.cities-link a': 'show_cities'

    initialize: (item) ->
      # so far I think I have no model for this view.
      #
      # @model = item.model
      _.bindAll @, 'show_cities', 'show_newsitems'

    show_cities: (item) ->
      @deactivate_all()
      $(item.currentTarget).addClass('active')
      U.models.cities.fetch
        success: ->
          MyApp.right_region.show U.views.cities.index
        
    show_newsitems: (item) ->
      @deactivate_all()
      $(item.currentTarget).addClass('active')
      U.models.newsitems.fetch
        success: ->
          MyApp.right_region.show( U.views.newsitems )

    deactivate_all: (item) ->
      while $(".right-menu ul li a.active").length > 0
        _.each $(".right-menu ul li a.active"), (key, value) ->
          item = $(".right-menu ul li a.active").eq(value)
          item.removeClass('active')
