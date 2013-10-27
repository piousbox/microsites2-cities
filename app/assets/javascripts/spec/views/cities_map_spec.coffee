
describe "Cities Views", ->

  beforeEach ->
    a = 'a'

  afterEach ->
    a = 'a'

  describe "templates", ->
    it 'everything', ->
      expect( $('#cities_map-template').length ).toEqual( 1, 'Cities Map template must be defined' )

  describe 'cities', ->
    describe 'right menu', ->
      it 'shows cities', ->
        U.models.newsitems = new Collections.Newsitems.Index({})
        specimen = new Views.Cities.RightMenu({ model: U.models.city })
        expect( specimen.show_cities($ 'body' ) ).toBeDefined()
        # expect( specimen.show_newsitems($ 'body' ) ).toBeDefined( 'Show newsitems is defined' )
        
      it 'has function deactiveate_all()', ->
        U.models.city = new Models.City({ cityname: 'rio' })
        expect( U.models.city ).toBeDefined( 'U.models.city should be defined' )
        specimen = new Views.Cities.RightMenu({ model: U.models.city })
        expect( specimen.deactivate_all() ).toBeDefined()

    describe 'left menu', ->
      it 'has the marionette view', ->
        new_view = new Views.Cities.LeftMenu({ model: U.models.city })
        expect( new_view ).toBeDefined()

    describe 'index', ->
      it 'is instantiable', ->
        index_view = new Views.Cities.Index()
        expect( index_view ).toBeDefined()
        expect( index_view.sanity ).toBeTruthy( 'Saaanity' )

    describe 'map', ->
      it 'is instantiable', ->
        map_view = new Views.Cities.Map({ model: new Models.Cities() })
        expect( map_view ).toBeDefined()
        expect( map_view.sanity ).toBeTruthy( 'Saaanity of map view' )
      
      it 'shows _the_world_ map on the homepage, not any other', ->
        spyOn( U.views.cities.map, 'show_map' )
        expect( false ).toBeTruthy( '@TODO: will modifying the id of the body trigger what I want? HEREHERE' )
        
        expect( 1 == $('body#cities_index').length ).toBeTruthy( 'We are on the homepage' )
        
        