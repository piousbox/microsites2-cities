
describe "Cities Home Views", ->

  beforeEach ->
    @site_model = new Models.Site({ domain: 'travel-guide.mobi' })
    @sites_newsitems_collection = new Collections.Newsitems.Index({ domain: 'travel-guide.mobi' })

  afterEach ->
    a = 'a'

  describe "templates", ->
    expect( $('#cities_home-template').length ).toEqual( 1, 'Cities Home template must be defined' )
    expect( $('#sites_newsitems-template').length ).toEqual( 1, 'Sites Newsitems Index template must be defined' )

  describe '#show', ->
    composite_view = new Views.Cities.Home({ model: @site_model })
    expect( composite_view ).toBeDefined()
    expect( composite_view instanceof Views.Cities.Home ).toBeTruthy()

  it '#newsitems', ->
    newsitems_view = new Views.Newsitems.Index({ collection: @site_newsitems_collection })
    expect( newsitems_view ).toBeDefined()