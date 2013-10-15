
describe "Gallery Views", ->

  beforeEach ->
    @ze_model = new Models.Gallery({ galleryname: 'galleryname' })

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