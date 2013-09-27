
describe "Galleries", ->

  beforeEach ->
    a = $("<div>").attr('id', 'main')
    b = $("<div>").addClass('index')
    a.append b
    $('body').append a

  afterEach ->
    # $("#main").remove()

  describe "abstract views", ->

    it 'should have index', ->
      a = new Views.Galleries.Index
      expect( a.template ).toEqual( '#galleries-template' )

    it 'should have show_small', ->
      a = new Views.Galleries.ShowSmall
      expect( a.template ).toEqual( '#gallery_small-template' )








      