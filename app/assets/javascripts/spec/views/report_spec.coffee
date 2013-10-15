
describe "Report Views", ->

  beforeEach ->
    @report_model = new Models.Report({ name_seo: 'new-report-in-new-york' })

  describe "templates", ->
    it 'everything', ->
      expect( $('#report_show-template').length ).toEqual( 1, 'Report Show template must be defined' )
      expect( $('#reports_indexitem-template').length ).toEqual( 1, 'Report Indexitem template must be defined' )

  describe 'show', ->
    it 'is instantiable', ->
      report_view = new Views.Report.Show({ model: @report_model })
      expect( report_view ).toBeDefined()

  describe 'indexitem', ->
    it 'instantiates', ->
      view = new Views.Reports.IndexItem({ model: @report_model })
      expect( view ).toBeDefined()