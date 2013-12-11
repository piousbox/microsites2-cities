$(document).ready ->

  Views.Newsitems.ShowSmall = Backbone.Marionette.ItemView.extend
    template: '#newsitems_show_small-template'
    model: Models.Newsitem

    events:
      'click a.gallery-link': 'show_gallery'
      'click a.report-link': 'show_report'

    initialize: (nothing) ->
      _.bindAll @, 'show_gallery', 'show_report'

    show_gallery: (item) ->
      U.views.city.show.show_gallery( item )

    show_report: (item) ->
      U.models.report = new Models.Report({ name_seo: item.currentTarget.attributes['reportname'].value })
      U.views.report = new Views.Report.Show({ model: U.models.report })
      U.models.report.fetch
        success: ->
          MyApp.left_region.show( U.views.report )

  Views.Newsitems.Index = Backbone.Marionette.CollectionView.extend
    itemView: Views.Newsitems.ShowSmall

    initialize: (item) ->
      this.collection = item.collection # U.models.newsitems || U.collections.newsitems

