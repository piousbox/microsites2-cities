
describe "Manager Galleries Views", ->

  beforeEach ->
    a = $("<div>").attr('id', 'main')
    b = $("<div>").addClass('index')
    a.append b
    $('body').append a

  afterEach ->
    # $("#main").remove()

  describe "views", ->
    it 'defines views', ->
      galleries = new Views.ManagerGalleries()
      expect( galleries ).toBeDefined()
      gallery = new Views.ManagerGallery({ 'galleryname': 'Aaa' })
      expect( gallery ).toBeDefined()

  describe 'galleries show', ->
    it 'defines collection view `galleries`', ->
      expect(1).toEqual(2)

    it 'defines ite view `photo`', ->
      expect(1).toEqual(2)

  describe 'templates', ->
    it "makes sure they exist", ->
      expect( $('#manager_galleries_index-template').length ).toEqual(1)
      expect( $('#manager_galleries_index-item-template').length ).toEqual(1)
      expect( $('#manager_galleries_photo-template').length ).toEqual(1)




