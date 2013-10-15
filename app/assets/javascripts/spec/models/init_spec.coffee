
describe "Galleries", ->

  beforeEach ->
    a = 'a'

  describe "some globals", ->

    it 'lang', ->
      expect( U.lang ).toEqual( 'en' )

    it 'U.models.site', ->
      expect( U.models.site ).toBeDefined()


