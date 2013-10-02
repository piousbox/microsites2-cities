
describe "City Views", ->

  beforeEach ->
    a = 'a'

  afterEach ->
    a = 'a'

  describe "templates", ->
    it 'everything', ->
      expect( $('#city_map-template').length ).toEqual( 1, 'City Map template must be defined' )
      expect( $('#city_show-template').length ).toEqual( 1, 'City Show template must be defined' )

  describe 'show', ->
    it 'is instantiable', ->
      city_model = new Models.City({ cityname: 'Rio_de_Janeiro' })
      city_view = new Views.City.Show({ model: city_model })
      expect( city_view ).toBeDefined()

    it 'renders a report when clicking on a report-link', ->
      city_model = new Models.City({ cityname: 'Rio_de_Janeiro' })
      city_view = new Views.City.Show({ model: city_model })

    it 'has a list of videos', ->
      expect( false ).toBeTruthy()

    it 'has a list of venues', ->
      expect( false ).toBeTruthy()

    it 'has a list of current_users', ->
      expect( false ).toBeTruthy()

