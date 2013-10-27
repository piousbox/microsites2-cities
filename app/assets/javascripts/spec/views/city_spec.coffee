
describe "City Views", ->

  beforeEach ->
    a = 'a'

  afterEach ->
    a = 'a'

  describe "templates", ->
    it 'everything', ->
      expect( $('#city_show-template').length ).toEqual( 1, 'City Show template must be defined' )

  describe 'right menu', -> 
    it 'is defined', ->
      one = new Views.City.RightMenu({ model: new Models.City('San_Francisco') })
      expect( one ).toBeDefined()
        
  describe 'city#show', ->
    it 'is defined', ->
      result = new Views.City.Show({ model: new Models.City('San_Francisco') })
      expect( result ).toBeDefined()

  describe 'show', ->
    it 'is instantiable', ->
      city_model = new Models.City({ cityname: 'Rio_de_Janeiro' })
      city_view = new Views.City.Show({ model: city_model })
      expect( city_view ).toBeDefined()

    it 'renders a report when clicking on a report-link', ->
      city_model = new Models.City({ cityname: 'Rio_de_Janeiro' })
      city_view = new Views.City.Show({ model: city_model })

