
describe "Newsitems Views", ->

  beforeEach ->
    a = 'a'

  afterEach ->
    a = 'a'

  it 'has templates', ->
    expect( $('#newsitems_gallery-template').length ).toEqual( 1, 'Newsitems gallery template must be defined.' )
    expect( $('#newsitems_report-template').length ).toEqual( 1, 'Newsitems report template must be defined.' )

  describe 'show', ->
    it 'is instantiable', ->
      the_model = new Models.Site({ domain: 'travel-guide.mobi', lang: 'en' })
