Microsites2::Application.routes.draw do

  root :to => 'cities#index'

  scope "/:locale", :constraints => { :locale => /en|ru|pt/ } do
    root :to => 'cities#index'

    devise_for :users, :controllers => {
      :sessions => "users/sessions",
      :registrations => 'users/registrations'
    }

    get '/features', :to => 'sites#features', :as => :features
    get '/features/page/:features_page', :to => 'sites#features'
    get '/about', :to => 'welcome#about', :as => :about
    get '/contact', :to => 'welcome#contact', :as => :contact
    get '/about-resumes', :to => 'users#about', :as => :resumes_about
    get '/privacy', :to => 'welcome#privacy', :as => :privacy
    get '/help', :to => 'welcome#help', :as => :help
    
    match 'photos/driver-for/:gallery_id' => 'photos#driver', :as => :add_photos
    match 'photos/do_upload/:gallery_id/by/:username', :to => 'photos#do_upload', :as => :do_upload
    get 'photos/new_profile_photo', :to => 'photos#new', :defaults => { :is_profile => true }, :as => :new_profile_photo
    get 'photos/new-for-gallery/:gallery_id', :to => 'photos#new', :as => :new_photo_for_gallery
    resources :photos
  
    get 'tags/view/:name_seo', :to => 'tags#show', :as => :tag
    get 'tags/view/:name_seo/galleriespage/:galleries_page', :to => 'tags#show'

    get '/users', :to => 'users#index', :as => :users
    get '/users/show/:username', :to => 'users#show', :as => :user
    put '/users/:id/update', :to => 'users#update', :as => :user_update
    get '/users/:username/articles', :to => 'users#reports'
    get '/users/:username/articles/page/:reports_page', :to => 'users#reports'
    get '/users/:username/reports', :to => 'users#reports', :as => :user_reports
    get '/users/:username/reports/show/:name_seo', :to => 'users#report', :as => :user_report
    get '/users/:username/galleries', :to => 'users#galleries', :as => :user_galleries
    match '/users/scratchpad', :to => 'users#scratchpad', :as => :scratchpad
    get '/users/sign_in', :to => 'users#sign_in', :as => :sign_in
    get '/users/organizer', :to => 'users#organizer', :as => :organizer
    put '/users/show/:id', :to => 'users#update'
    get '/users/new_profile', :to => 'users#new_profile', :as => :new_user_profile
    get '/users/:username/profiles/:profile_id/edit', :to => 'users#edit_profile', :as => :edit_user_profile
    get '/users/gallery/:galleryname', :to => 'users#gallery', :as => :user_gallery
    get '/users/in-city/:cityname', :to => 'users#index', :as => :users_in_city
    match '/users/search', :to => 'users#index', :as => :users_search
    get '/users/:username/github', :to => 'users#github_page', :as => :user_github
    get '/settings', :to => 'users#edit', :as => :settings

    get '/venues/show/:name_seo', :to => 'venues#show', :as => :venue
    get '/venues/in-city/:cityname', :to => 'venues#index', :as => :venues_in_city
    get '/venues/show/:name_seo/news', :to => 'venues#news', :as => :venue_news
    get '/venues/:venuename/reports/show/:reportname', :to => 'venues#report', :as => :venue_report
    get '/venues/:venuename/galleries/show/:galleryname', :to => 'venues#gallery', :as => :venue_gallery

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
    get 'cities', :to => 'cities#index', :as => :cities

    get 'reports/view/:name_seo', :to => 'reports#show', :as => :report
    match 'reports/promo/:name_seo' => redirect { |params, request| "reports/view/#{params[:name_seo]}" }
    get 'reports/show/:name_seo', :to => 'reports#show'
    get 'reports/in-city/:cityname', :to => 'reports#index'
    post 'reports/search', :to => 'reports#search', :as => :search_reports
    post 'reports/search', :to => 'reports#search', :as => :my_search_reports, :defaults => { :my => true }
    get 'reports/search/:search_keyword', :to => 'reports#search'
    get 'reports/page/:reports_page', :to => 'reports#index'
    get 'reports/:name_seo/venues', :to => 'reports#venues'
    put '/reports/:id', :to => 'reports#update', :as => :update_report

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

    ##
    ## videos
    ##
    get 'videos/in-city/:cityname', :to => 'videos#index', :as => :videos_in_city
    get 'videos/view/:youtube_id', :to => 'videos#show', :as => :video
    get 'videos/in-tag/:tagname', :to => 'videos#index', :as => :videos_in_tag

    # get 'set_locale', :to => 'welcome#set_locale', :as => :set_locale
    post 'set_city', :to => 'welcome#set_city', :as => :set_city

    get 'events/in-city/:cityname', :to => 'events#index', :as => :events_in_city
    
    resources :events
    resources :galleries
    resources :reports
    resources :tags
    resources :videos
    resources :venues

    get 'v', :to => 'utils/utils#version', :as => :version
    
    #
    # venues
    #
    match '/venues/:venue_type/in/:cityname' => redirect { |params, request| "/en/cities/travel-to/#{params[:cityname]}" }

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

end
