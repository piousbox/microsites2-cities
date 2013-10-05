
describe "Site", ->

  it 'instantiates models', ->
    domain = 'travel-guide.mobi'
    U.models.site = new Models.Site( domain: domain )
    U.models.site.fetch
      success: ->
        expect( U.models.site.get('domain') ).toEqual( domain )
      












