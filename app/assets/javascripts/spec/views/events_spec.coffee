
describe "Events Views", ->

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
    it 'everything', ->
      expect( $('#events_show-template').length ).toEqual( 1, 'Events/show template must be defined' )

  describe 'instance of views', ->
    it 'has them', ->
      this_model = new Models.Event({ eventname: '2013-09-22-where-is-decomp' })
      new_view = new Views.Events.Show({ model: this_model })
      expect( new_view ).toBeDefined()