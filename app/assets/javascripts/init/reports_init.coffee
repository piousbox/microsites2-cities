
$( document ).ready ->

  if $(".report-name-seo").length > 0
    name_seo = $(".report-name-seo").attr('report_name_seo')
    U.models.report = new Models.Report({ name_seo: name_seo })
    U.views.report = new Views.Report.Show({ model: U.models.report })
    U.models.report.fetch
      success: ->
        MyApp.left_region.show( U.views.report )
