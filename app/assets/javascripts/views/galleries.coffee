$(document).ready ->

  Views.Gallery.Show = Backbone.Marionette.ItemView.extend
    template: '#gallery_show-template'
    model: Models.Gallery
    # tagName: 'div'
    # className: 'report'

    initialize: ->      
      @on('render', @afterRender)

    afterRender: ->
      ad_content = $('.ad-large-rectangle')[0].innerHTML
      this.$el.append( ad_content )


  Views.Galleries.ShowSmall = Backbone.Marionette.ItemView.extend
    template: '#gallery_small-template'
    model: Models.Gallery
    

  Views.Galleries.Index = Backbone.Marionette.CompositeView.extend
    template: '#galleries-template'
    itemView: Views.Galleries.ShowSmall

    events:
      'click a.show-gallery': 'show_gallery'

    initialize: ->
      _.bindAll @, 'show_gallery', 'appendHtml'

    appendHtml: (collectionView, itemView) ->
      collectionView.$('.galleries').append itemView.el

    show_gallery: (item) ->
      U.views.cities.left_menu.deactivate_all()
      console.log 'showing gallery'
      
      if item.galleryname
        name_seo = item.galleryname
      else
        name_seo = $(item.currentTarget).attr('name_seo')

      U.models.gallery = new Models.Gallery({ galleryname: name_seo })
      U.models.gallery.fetch
        success: ->
          U.views.gallery = new Views.Galleries.Show
            model: U.models.gallery
          MyApp.left_region.show( U.views.gallery )

  Views.Galleries.IndexItem = Backbone.Marionette.ItemView.extend
    template: '#galleries_indexitem-template'

    initialize: ->
      _.bindAll @, 'nothing'

    nothing: ->
      console.log( 'nothing' )
