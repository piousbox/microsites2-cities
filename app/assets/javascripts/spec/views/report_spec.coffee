
describe "Report Views", ->

  beforeEach ->
    a = 'a'

  afterEach ->
    a = 'a'

  describe "templates", ->
    it 'everything', ->
      expect( $('#report_show-template').length ).toEqual( 1, 'Report Show template must be defined' )

  describe 'show', ->
    it 'is instantiable', ->
      report_model = new Models.Report({ name_seo: 'new-report-in-new-york' })
      report_view = new Views.Report.Show({ model: report_model })
      expect( report_view ).toBeDefined()
