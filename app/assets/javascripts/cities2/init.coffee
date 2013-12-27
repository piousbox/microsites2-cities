
$(document).ready ->
  AppRouter = Backbone.Router.extend
    routes:
      '*actions': 'defaultRoute'

  U.app_router = new AppRouter

  U.app_router.on 'route:defaultRoute', (actions) ->
    alert(actions)

  Backbone.history.start()