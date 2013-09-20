
$(document).ready ->
  if $( ".Lcities" ).length > 0

    if $( ".ids" ).length > 0
      cityname = $( '.ids' ).attr( 'cityname' )

      #
      # Models
      #
      U.models.city = new Models.City( 'cityname': cityname )
      
      #
      # Collections
      #
      U.models.venues = new Collections.Venues({ cityname: cityname })
      U.models.reports = new Collections.Reports({ cityname: cityname })
      U.models.galleries = new Collections.Galleries({ cityname: cityname })
      U.models.users = new Collections.Users({ cityname: cityname })
      U.models.videos = new Collections.Videos({ cityname: cityname })

      #
      # Views
      #
      # U.views.cities.home = new Views.Cities.Home({ model: U.models.city })
      # U.views.cities.map = new Views.Cities.Map({ 'model': U.models.city })
      # U.views.cities.right_menu = new Views.Cities.RightMenu({ model: U.models.city })
      # U.views.cities.left_menu = new Views.Cities.LeftMenu({ model: U.models.city })
      U.views.city.show = new Views.City.Show({ model: U.models.city })
      U.views.city.map = new Views.City.Map({ model: U.models.city })

      MyApp.start()
      # Backbone.history.start({ pushState: true, root: "/en" })

      MyApp.right_region.show( U.views.city.show )
      MyApp.left_region.show( U.views.city.map )

      # MyApp.right_menu.show( U.views.cities.right_menu )
      # MyApp.left_menu.show( U.views.cities.left_menu )

      U.models.city.fetch
        success: ->
          # MyApp.right_menu.show( U.views.cities.right_menu )
          # MyApp.left_region.show( U.views.cities.map )
          # U.views.cities.map.show_map()
          # U.views.cities.right_menu.finish_rendering()

  if $("body#cities_index").length > 0 || $("#spec_runner_pqf").length > 0
    # CanvasOps.cities_index_initialize()

    U.models.cities = new Models.Cities()
    # U.models.site = new Models.Site({ domain: '', locale: '' })
    # U.models.newsitems = new Collections.Newsitems()

    U.views.cities.index = new Views.Cities.Index()
    U.views.cities.map = new Views.Cities.Map({ model: U.models.cities })
    U.views.cities.right_menu = new Views.Cities.RightMenu({ model: U.models.cities })
    U.views.cities.left_menu = new Views.Cities.LeftMenu({ model: U.models.cities })
    # U.views.newsitems = new Views.Newsitems.Index({ 'model': U.models.newsitems })
   
    MyApp.start()

    # this works perfectly fine
    #
    #U.models.cities.fetch
    #  success: ->
    #    MyApp.right_region.show( U.views.cities.index )

    # the below works perfectly fine, I need to uncomment it. @todo
    #
    #U.models.site.fetch
    #  success: ->
    #    MyApp.right_region.show( U.views.sites.newsitems )

    MyApp.right_menu.show( U.views.cities.right_menu )
    MyApp.left_menu.show( U.views.cities.left_menu )
    MyApp.right_region.show( U.views.cities.index )
    MyApp.left_region.show( U.views.cities.map )

    # Backbone.history.start({ pushState: true, root: "/en" })

  if $("#cities_show_canvas").length > 0
    cityname = $( '#cities_show_canvas' ).attr( 'cityname' )
    U.views.cities.map = new Views.Cities.Map
      model: U.models.city = new Models.City( 'cityname': cityname )

    