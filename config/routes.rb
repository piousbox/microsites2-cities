Microsites2::Application.routes.draw do

  match '/' => redirect { |params, request| "/en/cities" } # angular

  scope "/:locale", :constraints => { :locale => /en|ru|pt/ } do
    root :to => 'welcome#home'

    devise_for :users, :controllers => {
      :sessions => "users/sessions",
      :registrations => 'users/registrations'
    }
    
    get 'cities', :to => 'cities#index'
    get 'cities/*angular', :to => 'cities#index'
    # get 'cities/travel-to/:cityname', :to => 'cities#profile', :as => :city
    # scope 'cities/travel-to/:cityname', :as => :city do
    #   get 'today', :to => 'cities#today', :as => :today
    #   get 'reports', :to => 'reports#index', :as => :reports
    #   get 'reports/page/:reports_page', :to => 'reports#index'
    #   get 'galleries', :to => 'galleries#index', :as => :galleries
    #   get 'galleries/page/:galleries_page', :to => 'galleries#index'
    #   get 'events', :to => 'events#index', :as => :events
    #   get 'events/page/:events_page', :to => 'events#index'
    #   get 'users', :to => 'users#index', :as => :users
    #   get 'users/page/:users_page', :to => 'users#index'
    #   get 'venues', :to => 'venues#index', :as => :venues
    #   get 'venues/page/:venues_page', :to => 'venues#index'
    #   get 'venue-type/:venue_type_name', :to => 'reports#index', :as => :venue_type
    #   # videos?
    # end

    # get 'events/in-city/:cityname', :to => 'events#index', :as => :events_in_city
    get 'events/new', :to => 'events#new'
    get 'events/show/:eventname', :to => 'events#show', :as => :event
    # resources :events

    get 'galleries', :to => 'galleries#index', :as => :galleries
    get 'galleries/view/:galleryname', :to => 'galleries#show' # , :constraints => { :format => /json/ }
    get 'galleries/view/:galleryname/:photo_idx', :to => 'galleries#show', :as => :gallery
    get 'galleries/show/:galleryname/:photo_idx', :to => 'galleries#show'
    get 'galleries/show/:galleryname', :to => 'galleries#show'
    # get 'galleries/:id/edit', :to => 'galleries#edit', :as => :edit_gallery
    # post 'galleries/:id', :to => 'galleries#update', :as => :update_gallery
    resources :galleries

    get 'photos/new', :to => 'photos#new'

    get 'reports/new', :to => 'reports#new'
    get 'reports/view/:name_seo', :to => 'reports#show'
    get 'reports/show/:name_seo', :to => 'reports#show'
    put 'reports/:id', :to => 'reports#update', :as => :reports_update
    get 'reports', :to => 'reports#index', :as => :reports
    # resources :reports
            
    get 'reviews/new', :to => 'reviews#new'

    # get 'set_locale', :to => 'welcome#set_locale', :as => :set_locale
    post 'set_city', :to => 'welcome#set_city', :as => :set_city
    get 'sitemap', :to => 'utils/sitemaps#sitemap'
    
    get 'tags' => redirect { |params, r| "http://piousbox.com/en/tags" }
    get 'tags/view/:tagname' => redirect { |params, r| "http://piousbox.com/en/tags/view/#{params[:tagname]}" }

    get 'users', :to => 'users#index'
    get 'users/show/:username', :to => 'users#show'
    get 'users/organizer', :to => 'users#organizer', :as => :organizer

    get 'v', :to => 'utils/utils#version', :as => :version

    get 'venues/new', :to => 'venues#new'
    get 'venues/show/:name_seo', :to => 'venues#show', :as => :venue
    get 'venues', :to => 'venues#index'
    # get 'venues/show/:venuename/news', :to => 'venues#news', :as => :venue_news # @deprecated
    # get 'venues/show/:venuename/reports/show/:reportname', :to => 'venues#report', :as => :venue_report
    # get 'venues/show/:venuename/galleries/show/:galleryname', :to => 'venues#gallery', :as => :venue_gallery
    # resources :venues

    # get 'videos/in-city/:cityname', :to => 'videos#index', :as => :videos_in_city
    # get 'videos/view/:youtube_id', :to => 'videos#show', :as => :video
    # get 'videos/in-tag/:tagname', :to => 'videos#index', :as => :videos_in_tag
    # resources :videos

    # match '/' => redirect { |params, request| "/en/cities" }
    match '*other', :to => 'errors#five_hundred'

  end # end locale

  get 'cities/travel-to/:cityname', :to => 'cities#profile'
  get 'cities/travel-to', :to => 'cities#index'
  get "cities/travel-to/:cityname" => redirect { |params, request| "/en/cities/travel-to/#{params[:cityname]}" }
  get 'cities', :to => 'cities#index'

  # match 'events/*everything' => redirect { |params, request| '/' }
  # match 'events' => redirect { |params, request| '/' }

  post 'photos', :to => 'photos#create'
  get "piousbox" => redirect { |params, request| "/en/users/show/piousbox" }

  get 'reports', :to => 'reports#index', :as => :reports
  # get 'reports/view/:name_seo', :to => 'reports#show', :as => :report

  # get 'sitemap', :to => 'utils/sitemaps#sitemap', :as => :sitemap

  get 'users/show/:username' => redirect { |params, request| "/en/users/show/#{params[:username]}" }

  get 'venues', :to => 'venues#index', :as => :venues
  get 'venues/show/:name_seo', :to => 'venues#show', :as => :venue
  # resources :venues

  get 'venue_types/*everything' => redirect { |params, request| '/' }
  get 'venue_types' => redirect { |params, request| '/' }

  #
  # old legacy stuff
  #
  get 'google4b2e82b4dbbf505d', :to => 'utils/verification#one'
  get 'index.php/events/calendar/*everything' => redirect { |params, request| '/' }
  get 'index.php/events/view/*everything' => redirect { |params, request| '/' }
  get 'index.php/events/in/:cityname' => redirect { |params, request| "/cities/travel-to/#{params[:cityname]}" }
  get 'index.php' => redirect { |params, request| '/' }
  match 'admin/*everything' => redirect { |params, request| '/' }
  match 'admin' => redirect { |params, request| '/' }
  match 'dictionaryitems/*everything' => redirect { |params, request| '/' }
  match 'dictionaryitems' => redirect { |params, request| '/' }
  match 'helps/*everything' => redirect { |params, request| '/' }
  match 'helps' => redirect { |params, request| '/' }
  match '*other' => redirect { |params, request| "/en/#{params[:other]}" }

end
