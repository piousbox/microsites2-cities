
$(document).ready ->        
  if $("body#cities_index").length > 0 || $("#spec_runner_pqf").length > 0
    U.models.cities = new Models.Cities()
    # U.models.site = new Models.Site({ domain: '', locale: '' })
    # U.models.newsitems = new Collections.Newsitems()

    U.views.cities.index = new Views.Cities.Index()
    U.views.cities.map = new Views.Cities.Map({ model: U.models.cities })
    U.views.cities.right_menu = new Views.Cities.RightMenu({ model: U.models.cities })
    U.views.cities.left_menu = new Views.Cities.LeftMenu({ model: U.models.cities })
    U.views.cities.home = new Views.Cities.Home()
    # U.views.newsitems = new Views.Newsitems.Index({ 'model': U.models.newsitems })
   
    MyApp.start()
    # router = new U.Router()
    # Backbone.history.start({ root: "/en" })

#    U.models.cities.fetch
#      success: ->
#        MyApp.right_menu.show( U.views.cities.right_menu )
#        MyApp.right_region.show( U.views.cities.index )
#        MyApp.left_menu.show( U.views.cities.left_menu )
#        MyApp.left_region.show( U.views.cities.map )

    MyApp.right_menu.show( U.views.cities.right_menu )
    MyApp.right_region.show( U.views.cities.home )
    MyApp.left_menu.show( U.views.cities.left_menu )
    MyApp.left_region.show( U.views.cities.map )

    # the below works perfectly fine, I need to uncomment it. @todo
    #
    #U.models.site.fetch
    #  success: ->
    #    MyApp.right_region.show( U.views.sites.newsitems )


    