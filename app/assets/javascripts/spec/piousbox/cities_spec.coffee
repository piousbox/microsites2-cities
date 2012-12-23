
describe "Cities", ->

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
    
  afterEach ->
    $("#main").remove()
    $(".map").remove()
    $(".left-container").remove()
    $(".right-container").remove()
    $(".map-container").remove()

    
  describe "models", ->
    it "there should be city model", ->
      U.models.city = new Models.City()
      expect( U.models.city.url() ).toEqual('/cities.json')
      
      U.models.city.cityname = 'rio'
      expect( U.models.city.url() ).toEqual('/cities/travel-to/rio.json')

      # expect( U.models.galleries ).toBeDefined( 'galleries should be defined' )
      # expect( U.models.reports ).toBeDefined( 'reports should be defined' )
      # expect( U.models.venues ).toBeDefined( 'venues should be defined' )
      # expect( U.models.city ).toBeDefined( 'city model should be defined' )

  describe 'globals', ->
    it 'should setup all the globals', ->
      expect( U.trash.sanity ).toEqual( 'saaanty' )
      expect( $('.ids').attr('cityname') ).toEqual( 'San_Francisco' )

  describe 'everything loaded', ->
    it 'models should be loaded', ->
      expect( U.models.galleries ).toBeDefined( 'models.galleries should be loaded')

  describe "views", ->

    it 'deactivates all', ->
      rio = new Models.City('rio')
      
      n_active_li = $(".right-menu ul li a.active").length
      expect( n_active_li > 1 ).toBeTruthy( 'more than one a.active' )
      view = new Views.Cities.RightMenu
        model: rio

      view.deactivate_all()
      n_active_li_2 = $(".right-menu ul li a.active").length
      expect( n_active_li_2 ).toBe( 0 )

    it 'click galleries, click venues', ->
      rio = new Models.City('rio')
      U.views.cities.right_menu = new Views.Cities.RightMenu( model: rio )
      
    it "should show calendar", ->
      U.views.cities.calendar = new Views.Cities.Calendar('rio')
      
      result = $(".calendar-container")

      expect( result.length > 0 ).toBeTruthy('calendar container should show up')

    it 'should have views.cities.home', ->
      expect( U.views.cities.home ).toBeDefined()





      
      