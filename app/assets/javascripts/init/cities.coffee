
$(document).ready ->        
  if $("body#cities_index").length > 0 || $("#spec_runner_pqf").length > 0
    U.models.cities = new Models.Cities()
    U.models.site = new Models.Site({ domain: 'travel-guide.mobi' })

    U.views.cities.index = new Views.Cities.Index()
    U.views.cities.map = new Views.Cities.Map({ model: U.models.cities })
    U.views.cities.right_menu = new Views.Cities.RightMenu({ model: U.models.cities })
    U.views.cities.left_menu = new Views.Cities.LeftMenu({ model: U.models.cities })
    U.views.cities.home = new Views.Cities.Home({ model: U.models.site })

    U.models.site.fetch
      success: ->
        MyApp.right_region.show( U.views.cities.home )
   
    MyApp.start()
    # router = new U.Router()
    # Backbone.history.start({ root: "/en" })

    MyApp.right_menu.show( U.views.cities.right_menu )
    MyApp.left_menu.show( U.views.cities.left_menu )
    MyApp.left_region.show( U.views.cities.map )

    