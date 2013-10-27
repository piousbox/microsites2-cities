$(document).ready ->
 
  Views.Cities.Home = Backbone.Marionette.CompositeView.extend
    template: '#cities_home-template'

    itemView: Views.Reports.IndexItem

    getItemView: (which_model) ->
      if !which_model
        return this.itemView
      else
        console.log( 'views.cities.home#getItemView' )
        console.log( which_model )        
        return Views.Galleries.IndexItem

    events:
      'click .report-link': 'show_report' # U.views.city.show.show_report
      'click .gallery-link': 'show_gallery'

    initialize: (options) ->
      _.bindAll @, "afterRender", 'show_report', 'show_gallery'
      # @on('render', @afterRender)
      @model = options.model

    afterRender: ->
      ad_content = $('.ad-large-rectangle')[0].innerHTML
      this.$el.append( ad_content )

    show_report: (item) ->
      name_seo = item.currentTarget.attributes.name_seo.value
      U.models.report = new Models.Report({ name_seo: name_seo })
      U.views.report = new Views.Report.Show({ model: U.models.report })
      U.models.report.fetch
        success: ->
          MyApp.left_region.show( U.views.report )

    show_gallery: (item) ->
      console.log( 'views.cities.home#show_gallery' )

