
describe "Gallery Views", ->

  beforeEach ->
    @ze_model = new Models.Gallery({ galleryname: 'galleryname' })
    a = $("<div>").attr('id', 'main')
    b = $("<div>").addClass('index')
    a.append b
    $('body').append a

  describe "templates", ->
    it 'everything', ->
      expect( $('#gallery_show-template').length ).toEqual( 1, 'Gallery Show template must be defined' )
      expect( $('#galleries_indexitem-template').length ).toEqual( 1, 'Gallery Indexitem template must be defined' )

  describe 'show', ->
    it 'is instantiable', ->
      ze_view = new Views.Gallery.Show({ model: @ze_model })
      expect( ze_view ).toBeDefined()

  describe 'indexitem', ->
    it 'instantiates', ->
      ze_view = new Views.Galleries.IndexItem({ model: @ze_model })
      expect( ze_view ).toBeDefined()

  describe "abstract views", ->
        
    it 'should have index', ->
      a = new Views.Galleries.Index
      expect( a.template ).toEqual( '#galleries-template' )

    it 'should have show_small', ->
      a = new Views.Galleries.ShowSmall
      expect( a.template ).toEqual( '#gallery_small-template' )
