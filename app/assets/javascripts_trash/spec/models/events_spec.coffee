
describe "Events", ->

  beforeEach ->
    a = $("<div>").attr('id', 'main')
    b = $("<div>").addClass('index')
    a.append b
    $('body').append a

    div_map = $('<div>').addClass('map')
    div_inner = $("<div>").addClass("inner")
    $('body').append( div_map.append(div_inner) )

  afterEach ->
    $("#main").remove()
    $(".map").remove()

  it "model should be instantiable", ->
    eventname = '2013-09-22-when-id-decomp'
    new_model = new Models.Event({ eventname: eventname })
    expect( new_model ).toBeDefined()


  



