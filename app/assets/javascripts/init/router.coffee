
U.Router = Backbone.Router.extend
  routes:
    "help": "help"
    "search/:query": "search"
    "search/:query/p:page": "search"

  help: ->
    console.log( 'help in routes' )

  search: (query, page) ->
    console.log( 'search in routes' )
