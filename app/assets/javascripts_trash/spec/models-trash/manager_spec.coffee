
describe "Manager", ->

  beforeEach ->
    a = $("<div>").attr('id', 'main')
    b = $("<div>").addClass('index')
    a.append b
    $('body').append a

  afterEach ->
    # $("#main").remove()

  describe "so far so good", ->

    it 'is sane', ->
      expect( true ).toBeTruthy()



