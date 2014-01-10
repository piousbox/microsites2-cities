$(document).ready ->
        
  Views.City.RightMenu = Backbone.Marionette.ItemView.extend
    events:
      'click a.reports_link': 'show_reports'
      'click a.places_link': 'show_venues'
      'click li.galleries_link a': 'show_galleries'
      'click a.videos_link': 'show_videos'
      'click a.users_link': 'show_users'

    initialize: (item) ->
      @model = item.model
      _.bindAll @, 'show_reports', 'show_venues', 'show_galleries', 'show_videos', 'show_users', 'deactivate_all', 'finish_rendering'

    finish_rendering: ->
      if '0' == @model.get('n_galleries').toString()
        $(".galleries-link").css('display', 'none')
        
    show_reports: (item) ->
      @deactivate_all()
      $(item.currentTarget).addClass('active')
      U.models.reports.fetch
        success: ->
          MyApp.right_region.show new Views.Reports.Index
            collection: U.models.reports

    show_venues: (item) ->
      @deactivate_all()
      $(item.currentTarget).addClass('active')
      U.models.venues.fetch
        success: ->
          MyApp.right_region.show new Views.Venues.Index
            collection: U.models.venues

    show_galleries: (item) ->
      @deactivate_all()
      $(item.currentTarget).addClass('active')
      U.models.galleries.fetch
        success: ->
          MyApp.right_region.show new Views.Galleries.Index
            collection: U.models.galleries

    show_videos: (item) ->
      @deactivate_all()
      $(item.currentTarget).addClass('active')
      U.models.videos.fetch
        success: ->
          MyApp.right_region.show new Views.Videos.Index
            collection: U.models.videos

    show_users: (item) ->
      @deactivate_all()
      $(item.currentTarget).addClass('active')
      U.models.users.fetch
        success: ->
          MyApp.right_region.show new Views.Users.Index
            collection: U.models.users

    deactivate_all: (item) ->
      while $(".right-menu ul li a.active").length > 0
        _.each $(".right-menu ul li a.active"), (key, value) ->
          item = $(".right-menu ul li a.active").eq(value)
          item.removeClass('active')
