
describe "Reports", ->

  it 'instantiates models', ->
    name_seo = 'new-report-in-new-york'
    U.models.report = new Models.Report( name_seo: name_seo )
    U.models.report.fetch
      success: ->
        expect( U.models.report.get('username') ).toEqual( 'piousbox' )
      












