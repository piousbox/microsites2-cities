
describe "Cities & City Models", ->

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
    
  describe "models", ->
    it "City", ->      
      U.models.city = new Models.City
        'cityname': 'Rio_de_Janeiro'
      expect( U.models.city.url() ).toEqual('/en/cities/travel-to/Rio_de_Janeiro.json')

    it 'Cities', ->
      U.models.cities = new Models.Cities()
      expect( U.models.cities ).toBeDefined()
      expect( U.models.cities.url() ).toEqual( '/en/cities.json' )

  describe 'globals', ->
    it 'should setup all the globals', ->
      expect( $('.ids').attr('cityname') ).toEqual( 'San_Francisco' )

  describe 'everything loaded', ->
    it 'models should be loaded', ->
      expect( U.models.galleries ).toBeDefined( 'models.galleries should be loaded')

  it 'should have the model object', ->
    expect( U.models.city ).toBeDefined()
	