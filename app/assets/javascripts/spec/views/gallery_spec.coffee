
describe "Gallery Views", ->

  beforeEach ->
    a = 'a'

  afterEach ->
    a = 'a'

  describe "templates", ->
    it 'everything', ->
      expect( $('#gallery_show-template').length ).toEqual( 1, 'Gallery Show template must be defined' )

  describe 'show', ->
    it 'is instantiable', ->
      ze_model = new Models.Gallery({ galleryname: 'galleryname' })
      ze_view = new Views.Gallery.Show({ model: ze_model })
      expect( ze_view ).toBeDefined()
