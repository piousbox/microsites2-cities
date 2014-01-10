
describe "Cities Views Map", ->

  beforeEach ->
    @this_model = new Models.Cities()

  describe 'map', ->
    it 'is instantiable', ->
      map_view = new Views.Cities.Map({ model: @this_model })
      expect( map_view ).toBeDefined()
      
    it 'shows _the_world_ map on the homepage, not any other', ->
      spyOn( Views.Cities.Map.prototype, 'show_map' ).andCallThrough()
      $('body').attr('id','cities_index')

      runs ->
        U.new_view = new Views.Cities.Map({model: @this_model})
        # new_view.show_map()
        U.initialize_cities()

      waits( 1000 )
      runs ->
        expect( Views.Cities.Map.prototype.show_map ).toHaveBeenCalled()
        # expect( U.new_view.show_map ).toHaveBeenCalled()

        