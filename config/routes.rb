Microsites2::Application.routes.draw do

  scope "/:locale", :constraints => { :locale => /en|ru|pt/ } do
    root :to => 'cities#index'

    devise_for :users, :controllers => {
      :sessions => "users/sessions",
      :registrations => 'users/registrations'
    }

    get '/features', :to => 'cities#features', :as => :features
    get '/features/page/:features_page', :to => 'cities#features'
    get '/newsitems', :to => 'cities#newsitems', :as => :newsitems
    get '/newsitems/page/:newsitems_page', :to => 'cities#newsitems'

    get '/about', :to => 'welcome#about', :as => :about
    get '/contact', :to => 'welcome#contact', :as => :contact
    get '/privacy', :to => 'welcome#privacy', :as => :privacy
    get '/help', :to => 'welcome#help', :as => :help
    
    match 'photos/driver-for/:gallery_id' => 'photos#driver', :as => :add_photos
    match 'photos/do_upload/:gallery_id/by/:username', :to => 'photos#do_upload', :as => :do_upload
    get 'photos/new_profile_photo', :to => 'photos#new', :defaults => { :is_profile => true }, :as => :new_profile_photo
    get 'photos/new-for-gallery/:gallery_id', :to => 'photos#new', :as => :new_photo_for_gallery
    resources :photos
  
    get 'tags/view/:name_seo', :to => 'tags#show', :as => :tag
    get 'tags/view/:name_seo/galleriespage/:galleries_page', :to => 'tags#show'
    resources :tags
    
    get '/users', :to => 'users#index', :as => :users
    get '/users/show/:username', :to => 'users#show', :as => :user
    put '/users/:id/update', :to => 'users#update', :as => :user_update
    get '/users/:username/reports', :to => 'users#reports', :as => :user_reports
    get '/users/:username/reports/show/:name_seo', :to => 'users#report', :as => :user_report
    get '/users/:username/galleries', :to => 'users#galleries', :as => :user_galleries
    get '/users/sign_in', :to => 'users#sign_in', :as => :sign_in
    put '/users/show/:id', :to => 'users#update'
    get '/users/gallery/:galleryname', :to => 'users#gallery', :as => :user_gallery
    get '/users/in-city/:cityname', :to => 'users#index', :as => :users_in_city
    match '/users/search', :to => 'users#index', :as => :users_search
    get '/settings', :to => 'users#edit', :as => :settings

    #
    # venues
    #
    match '/venues/:venue_type/in/:cityname' => redirect { |params, request| "/en/cities/travel-to/#{params[:cityname]}" }
    get '/venues/show/:name_seo', :to => 'venues#show', :as => :venue
    get '/venues/in-city/:cityname', :to => 'venues#index', :as => :venues_in_city
    get '/venues/show/:name_seo/news', :to => 'venues#news', :as => :venue_news
    get '/venues/:venuename/reports/show/:reportname', :to => 'venues#report', :as => :venue_report
    get '/venues/:venuename/galleries/show/:galleryname', :to => 'venues#gallery', :as => :venue_gallery
    resources :venues
    
    get 'cities', :to => 'cities#index', :as => :cities
    get 'cities/travel-to/:cityname', :to => 'cities#profile', :as => :city
    get 'cities/travel-to/:cityname/reports', :to => 'reports#index', :as => :reports_in_city
    get 'cities/travel-to/:cityname/galleries', :to => 'galleries#index', :as => :galleries_in_city
    get 'cities/travel-to/:cityname/events', :to => 'cities#events', :as => :events_in_city
    get 'cities/travel-to/:cityname/users', :to => 'users#index', :as => :users_in_city
    get 'cities/travel-to/:cityname/venues', :to => 'venues#index', :as => :venues_in_city
    get 'cities/travel-to/:cityname/venue-type/:venue_type_name', :to => 'reports#index', :as => :venue_type_in_city
    scope 'cities/travel-to/:cityname' do
      get 'today', :to => 'cities#today', :as => :today
    end

    get 'reports/view/:name_seo', :to => 'reports#show', :as => :report
    match 'reports/promo/:name_seo' => redirect { |params, request| "reports/view/#{params[:name_seo]}" }
    get 'reports/show/:name_seo', :to => 'reports#show'
    get 'reports/in-city/:cityname', :to => 'reports#index'
    post 'reports/search', :to => 'reports#search', :as => :search_reports
    get 'reports/search/:search_keyword', :to => 'reports#search'
    get 'reports/page/:reports_page', :to => 'reports#index'
    put '/reports/:id', :to => 'reports#update', :as => :update_report
    resources :reports
    
    ##
    ## galleries
    ##
    get 'galleries/in-city/:cityname', :to => 'galleries#index', :as => :galleries_in_city
    get 'galleries', :to => 'galleries#index', :as => :galleries
    get 'galleries/search', :to => 'galleries#search', :as => :search_galleries
    get 'galleries/search/:q', :to => 'galleries#search'
    get 'galleries/new', :to => 'galleries#new', :as => :new_gallery
    get 'galleries/show/:galleryname/:photo_idx', :to => 'galleries#show', :as => :gallery, :constraints => { :photo_idx => /.*/ }
    get 'galleries/show/:galleryname', :to => 'galleries#show'
    get 'galleries/:style/:galleryname', :to => 'galleries#show', :as => :gallery_show_style
    get 'my/galleries', :to => 'galleries#index', :defaults => { :my => true }, :as => :my_galleries
    get 'galleries/:id/edit', :to => 'galleries#edit', :as => :edit_gallery
    post 'galleries/:id', :to => 'galleries#update', :as => :update_gallery
    resources :galleries
    
    ##
    ## videos
    ##
    get 'videos/in-city/:cityname', :to => 'videos#index', :as => :videos_in_city
    get 'videos/view/:youtube_id', :to => 'videos#show', :as => :video
    get 'videos/in-tag/:tagname', :to => 'videos#index', :as => :videos_in_tag
    resources :videos
    
    # get 'set_locale', :to => 'welcome#set_locale', :as => :set_locale
    post 'set_city', :to => 'welcome#set_city', :as => :set_city

    get 'events/in-city/:cityname', :to => 'events#index', :as => :events_in_city
    get 'events/show/:eventname', :to => 'events#show', :as => :event
    resources :events
    
    get 'v', :to => 'utils/utils#version', :as => :version

    match '*other', :to => 'errors#five_hundred'
  end
  
  scope 'spec_runner', :as => :spec_runner do
    root :to => 'spec_runner#all'
    get ':which', :to => 'spec_runner#which', :as => :which
  end

  #
  # important non-locale-scoped stuff
  #
  get '/users/show/:username' => redirect { |params, request| "/en/users/show/#{params[:username]}" }
  get "/cities/travel-to/:cityname" => redirect { |params, request| "/en/cities/travel-to/#{params[:cityname]}" }
  get "/piousbox" => redirect { |params, request| "/en/users/show/piousbox" }
  get "/reports/view/:name_seo" => redirect { |params, request| "/en/reports/view/#{params[:name_seo]}" }
  get "/galleries/show/:galleryname" => redirect { |params, request| "/en/galleries/show/#{params[:galleryname]}" }
  get '/cities', :to => 'cities#index'

  #
  # old legacy stuff
  #
  get 'google4b2e82b4dbbf505d', :to => 'utils/verification#one'
  get 'index.php/events/calendar/*everything' => redirect { |params, request| '/' }
  get 'index.php/events/view/*everything' => redirect { |params, request| '/' }
  get 'index.php/events/in/:cityname' => redirect { |params, request| "/cities/travel-to/#{params[:cityname]}" }
  get 'index.php' => redirect { |params, request| '/' }
  get 'venue_types/*everything' => redirect { |params, request| '/' }
  get 'venue_types' => redirect { |params, request| '/' }

  ##
  ## admin &&
  ## old redirects
  ##
  match 'admin/*everything' => redirect { |params, request| '/' }
  match 'admin' => redirect { |params, request| '/' }
  match 'dictionaryitems/*everything' => redirect { |params, request| '/' }
  match 'dictionaryitems' => redirect { |params, request| '/' }
  match 'helps/*everything' => redirect { |params, request| '/' }
  match 'helps' => redirect { |params, request| '/' }
  match 'events/*everything' => redirect { |params, request| '/' }
  match 'events' => redirect { |params, request| '/' }

  # add scope
  match '*other' => redirect { |params, request| "/en/#{params[:other]}" }
  match '/' => redirect { |params, request| "/en/" }

end
