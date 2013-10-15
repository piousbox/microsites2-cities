
describe "Site", ->

  beforeEach ->
    @domain = 'travel-guide.mobi'

  it 'instantiates models', ->
    U.models.site = new Models.Site( domain: @domain )
    U.models.site.fetch
      success: ->
        expect( U.models.site.get('domain') ).toEqual( @domain )

  it 'collections.siteGalleries', ->
    collection = new Collections.SiteGalleries
    expect( collection ).toBeDefined()

  it 'newsitems', ->
    collection = new Collections.Sites.Newsitems({ domain: @domain })
    expect( collection ).toBeDefined()











