
describe "Cities Home Views", ->

  beforeEach ->
    a = 'a'

  afterEach ->
    a = 'a'

  describe "templates", ->
    it 'everything', ->
      expect( $('#cities_home-template').length ).toEqual( 1, 'Cities Home template must be defined' )

  describe 'show', ->
    it 'is instantiable', ->
      the_model = new Models.Site({ domain: 'travel-guide.mobi' })
      composite_view = new Views.Cities.Home({ model: the_model })
      expect( composite_view ).toBeDefined()
