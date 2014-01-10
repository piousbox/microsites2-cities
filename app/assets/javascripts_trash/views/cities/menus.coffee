$(document).ready ->

  # Views.City.Galleries = Backbone.View.extend      

  Views.Cities.LeftMenu = Backbone.Marionette.ItemView.extend
    template: '#left_menu-template'
    # model: Models.City

    events:
      'click .map-link a': 'show_map'
      'click .calendar-link a': 'show_calendar'
      'click .cities-link a': 'show_cities'

    initialize: (item) ->
      @model = item.model
      _.bindAll @, 'deactivate_all', 'show_map', 'show_calendar', 'show_cities'

    show_map: (item) ->
      console.log( 'showing cities map' )
      @deactivate_all()
      $(item.currentTarget).addClass('active')
      U.models.cities.fetch
        success: ->
          MyApp.left_region.show new Views.Cities.Map
            model: U.models.cities

    show_calendar: (item) ->
      @deactivate_all()
      $(item.currentTarget).addClass('active')
      U.models.city.fetch
        success: ->
          MyApp.left_region.show new Views.Cities.Calendar
            model: U.models.city

    show_cities: (item) ->
      @deactivate_all()
      $(item.currentTarget).addClass('active')
      U.views.cities.index = new Views.Cities.Index()
      U.models.cities.fetch
        success: ->
          MyApp.left_region.show( U.views.cities.index )
      
    deactivate_all: (item) ->
      while $(".left-menu ul li a.active").length > 0
        _.each $(".left-menu ul li a.active"), (key, value) ->
          item = $(".left-menu ul li a.active").eq(value)
          item.removeClass('active')


  Views.Cities.RightMenu = Backbone.Marionette.ItemView.extend
    template: '#cities_right_menu-template'
    # I think this is unnecessary if I set the @model in the initializer?
    # model: Models.City
    events:
      # 'click li.newsitems-link a': 'show_newsitems'
      'click li.cities-link a': 'show_cities'
      'click .home-link': 'show_home'

    initialize: (item) ->
      # so far I think I have no model for this view.
      #
      # @model = item.model
      _.bindAll @, 'show_cities', 'show_home', 'deactivate_all'

    show_cities: (item) ->
      @deactivate_all()
      $(item.currentTarget).addClass('active')
      U.views.cities.index = new Views.Cities.Index()
      U.models.cities.fetch
        success: ->
          MyApp.right_region.show U.views.cities.index
        
    # show_newsitems: (item) ->
    #   @deactivate_all()
    #   $(item.currentTarget).addClass('active')
    #   U.models.newsitems.fetch
    #     success: ->
    #       MyApp.right_region.show( U.views.newsitems )

    show_home: (nothing) ->
      console.log( 'U.views.cities.right_menu#show_home' )
      # U.views.cities.home = new Views.Cities.Home({ model: U.models.site })
      MyApp.right_region.show( U.views.cities.home )

    deactivate_all: (item) ->
      while $(".right-menu ul li a.active").length > 0
        _.each $(".right-menu ul li a.active"), (key, value) ->
          item = $(".right-menu ul li a.active").eq(value)
          item.removeClass('active')
