
describe "Cities Views", ->

  beforeEach ->
    a = $("<div>").attr('id', 'main')
    b = $("<div>").addClass('index')
    a.append b
    $('body').append a
    
    div_left_container = $('<div>').addClass('left-container')
    div_reports_show = $('<div>').addClass('reports-show')
    div_calendar_container = $('<div>').addClass('calendar-container') 
    div_map_container = $('<div>').addClass('map-container')
    div_map = $('<div>').addClass('map')
    div_inner = $("<div>").addClass("inner")

    $('body').append( div_left_container.append(div_inner.append(div_calendar_container)) )
    $('body').append( div_map_container )
    $('body').append( div_reports_show )

    right_menu = $('<ul>').append($('<li>').addClass('galleries_link'))
    $('body').append( right_menu )

    ns = $('<div>').addClass('ns').attr('n_reports', 0)
    $('body').append( ns )

  afterEach ->
    $("#main").remove()
    $(".map").remove()
    $(".left-container").remove()
    $(".right-container").remove()
    $(".map-container").remove()

  describe "templates", ->
    it 'map', ->
      expect( $('#cities_map-template').length ).toEqual( 1, 'Cities Map template must be defined' )

  describe 'cities', ->
    describe 'right menu', ->
      it 'has function deactiveate_all()', ->
        specimen = new Views.Cities.RightMenu()
        expect( specimen.deactivate_all() ).toBeDefined()

    describe 'left menu', ->
      it 'has the marionette view', ->
        new_view = new Views.Cities.LeftMenu()
        expect( new_view ).toBeDefined()

    it 'shows cities', ->
      specimen = new Views.Cities.RightMenu()
      expect( specimen.show_cities($ 'body' ) ).toBeDefined()

    it 'shows newsitems', ->
      specimen = new Views.Cities.RightMenu()
      expect( specimen.show_newsitems($ 'body' ) ).toBeDefined()

    describe 'index', ->
      it 'is instantiable', ->
        index_view = new Views.Cities.Index()
        expect( index_view ).toBeDefined()
        expect( index_view.sanity ).toBeTruthy()

    describe 'map', ->
      it 'is instantiable', ->
        map_view = new Views.Cities.Map({ model: new Models.Cities() })
        expect( map_view ).toBeDefined()
        expect( map_view.sanity ).toBeTruthy()

  describe 'city', ->
    describe 'right menu', -> 
      it 'is defined', ->
        one = new Views.City.RightMenu({ 'model': new Models.City('San_Francisco') })
        expect( one ).toBeDefined()   
      
  describe "views", ->
    it 'deactivates all', ->
      rio = new Models.City('cityname': 'Rio_de_Janeiro')
      
      n_active_li = $(".right-menu ul li a.active").length
      # expect( n_active_li > 1 ).toBeTruthy( 'more than one a.active' )
      view = new Views.Cities.RightMenu
        model: rio

      view.deactivate_all()
      n_active_li_2 = $(".right-menu ul li a.active").length
      expect( n_active_li_2 ).toBe( 0 )

    it 'disables links for galleries if there are no galleries', ->
      U.models.city = new Models.City( 'cityname': 'Rio_de_Janeiro' )
      $(".ns").attr("n_galleries", 0)
      $("li.galleries-link").css('display', 'block')
      expect( $('li.galleries-link').css('display') ).toBe( 'block' )
      U.models.city.fetch
        success: ->
          U.views.cities.right_menu = new Views.Cities.RightMenu( 'model': U.models.city )
          U.views.cities.right_menu.finish_rendering()
        
      waits(500)
      runs ->
        # alert(U.models.city.get('n_galleries'))
        expect( $("li.galleries-link").css('display') ).toBe( 'none' )
        # expect( 1 ).toBe( 0 )

    it 'click galleries, click venues', ->
      rio = new Models.City('Rio_de_Janeiro')
      U.views.cities.right_menu = new Views.Cities.RightMenu( model: rio )
      
    it "should show calendar", ->
      U.views.cities.calendar = new Views.Cities.Calendar('rio')
      result = $(".calendar-container")
      expect( result.length > 0 ).toBeTruthy('calendar container should show up')

    it 'should have views.cities.home', ->
      expect( U.views.cities.home ).toBeDefined()
