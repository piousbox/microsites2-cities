$(document).ready ->        
  if $( ".Lcities" ).length > 0
    if $( ".ids" ).length > 0
      cityname = $( '.ids' ).attr( 'cityname' )

      U.models.city = new Models.City( 'cityname': cityname )
      U.models.cities = new Models.Cities()

      U.views.city.show = new Views.City.Show({ model: U.models.city })
      U.views.city.left_menu = new Views.City.LeftMenu({ model: U.models.city })
      U.views.cities.left_menu = new Views.Cities.LeftMenu({})
      U.views.cities.right_menu = new Views.Cities.RightMenu({})
      U.views.city.map = new Views.City.Map({ model: U.models.city })

      MyApp.start()

      U.models.city.fetch
        success: ->
          MyApp.right_menu.show( U.views.cities.right_menu )
          MyApp.right_region.show( U.views.city.show )
          MyApp.left_menu.show( U.views.cities.left_menu )
        