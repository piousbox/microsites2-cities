
describe "Galleries", ->

  beforeEach ->
    a = 'a'

  describe "collections", ->

    it 'site_galleries', ->
      expect( U.collections.galleries ).toBeDefined()


