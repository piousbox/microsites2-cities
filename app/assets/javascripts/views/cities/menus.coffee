$(document).ready ->

  # Views.City.Galleries = Backbone.View.extend      

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
    template: '#cities_right_menu-template'
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
      U.views.cities.index = new Views.Cities.Index()
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
