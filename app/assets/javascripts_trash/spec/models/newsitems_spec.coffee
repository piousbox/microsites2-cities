
describe "Newsitems", ->

  beforeEach ->
    @domain = 'travel-guide.mobi'
    U.domain = 'pi.local2'
    U.lang = 'pt'

  it 'newsitems', ->
    collection = new Collections.Newsitems.Index({})
    expect( collection.url() ).toEqual( '/pt/sites/pi.local2/newsitems.json' )












