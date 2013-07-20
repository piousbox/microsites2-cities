$(document).ready ->

  Views.Newsitems.ShowSmall = Backbone.Marionette.ItemView.extend
    template: '#newsitems_show_small-template'
    model: Models.Newsitem

  Views.Newsitems.Index = Backbone.Marionette.CompositeView.extend
    template: '#newsitems_index-template'
    itemView: Views.Reports.ShowSmall

    events:
      'click a.show-report': 'show_report'

    initialize: ->
      _.bindAll @, 'show_report', 'appendHtml'

    appendHtml: (collectionView, itemView) ->
      collectionView.$('.reports').append itemView.el

    show_report: (item) ->      
      if item.name_seo
        name_seo = item.name_seo
      else
        name_seo = $(item.currentTarget).attr('name_seo')

      U.views.cities.left_menu.deactivate_all()
      
      U.models.report = new Models.Report({ name_seo: name_seo })
      U.models.report.fetch
        success: ->
          U.views.report = new Views.Reports.Show
            model: U.models.report
          MyApp.left_region.show( U.views.report )

          U.views.report_canvas = new Views.Reports.ShowMap
            model: U.models.report
          MyApp.right_region.show( U.views.report_canvas )

          CanvasOps.reports_show()