
describe "Users", ->

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

  describe "models", ->
    it "should not error out", ->
      expect( true ).toBeTruthy()
    
  describe "views", ->
  
    it "should show resume", ->
      expect( true ).toBeTruthy()
      
    it "should show index", ->
  
      # create the view
      U.views.reports.index = new Views.Reports.Index()
      
      r = U.views.reports.index.collection
      

      expect( r.length > 0 ).toBeTruthy()

      result = $("#main .index li")

      expect( result.length > 0 ).toBeTruthy()
      expect( result.length ).toEqual( 10 )


      
    it "should show show", ->
      reportname = 'an-example-deploy-rb-file-capistrano'
      U.views.reports.show = new Views.Reports.Show(reportname)
      

      result = $(".map .inner h3")
      expect( result.length > 0 ).toBeTruthy()

      