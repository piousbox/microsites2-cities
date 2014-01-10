$(document).ready ->
 
  Views.Cities.IndexItem = Backbone.Marionette.ItemView.extend
    model: Models.City
    template: '#cities_index_item-template'

  Views.Cities.Index = Backbone.Marionette.CollectionView.extend
    template: '#cities_index-template'
    itemView: Views.Cities.IndexItem
    sanity: true

    events:
      'click a.city-link': 'show_city'

    initialize: (item) ->
      this.collection = U.models.cities
      @on('render', @afterRender)

    afterRender: ->
      ad_content = $('.ad-large-rectangle')[0].innerHTML
      this.$el.append( ad_content )

    show_city: (item) ->
      U.models.city = new Models.City({ cityname: item.currentTarget.attributes.cityname.value })
      U.models.city.fetch
        success: ->
          U.views.city.show = new Views.City.Show({ model: U.models.city })
          # U.views.city.left_menu = new Views.City.LeftMenu
          MyApp.right_region.show( U.views.city.show )
          # U.views.city.show.show_map()
          # MyApp.left_menu.show( U.views.city.left_menu )        