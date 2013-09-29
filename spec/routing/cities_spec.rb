require 'spec_helper'
describe CitiesController do
  describe 'routes' do

    it 'general things' do
      expect( :get => '/en/cities/' ).to route_to( :controller => 'cities', :action => 'index', :locale => 'en' )
      expect( :get => '/en/cities/travel-to/Aaa' ).to route_to( :controller => 'cities', :action => 'profile', :cityname => 'Aaa', :locale => 'en' )
      expect( :get => '/en/cities/travel-to/Aaa/today' 
              ).to route_to( :controller => 'cities', :action => 'today', :cityname => 'Aaa', :locale => 'en' )

    end

    it 'reports' do
      expect( :get => '/en/cities/travel-to/Aaa/reports' 
              ).to route_to( :controller => 'reports', :action => 'index', :cityname => 'Aaa', :locale => 'en' )
      expect( :get => '/en/cities/travel-to/Aaa/reports/page/12'
              ).to route_to({ :controller => 'reports', :action => 'index', :cityname => 'Aaa', :locale => 'en', :reports_page => '12' })
    end

    it 'galleries' do
      expect( :get => '/en/cities/travel-to/Aaa/galleries' 
              ).to route_to( :controller => 'galleries', :action => 'index', :cityname => 'Aaa', :locale => 'en' )
      expect( :get => '/en/cities/travel-to/Aaa/galleries/page/12'
              ).to route_to({ :controller => 'galleries', :action => 'index', :cityname => 'Aaa', :locale => 'en', :galleries_page => '12' })

    end

    it 'events' do
      expect( :get => '/en/cities/travel-to/Aaa/events'
              ).to route_to( :controller => 'events', :action => 'index', :cityname => 'Aaa', :locale => 'en' ) 
      expect( :get => '/en/cities/travel-to/Aaa/events/page/12'
              ).to route_to({ :controller => 'events', :action => 'index', :cityname => 'Aaa', :locale => 'en', :events_page => '12' })

    end

    it 'users' do
      expect( :get => '/en/cities/travel-to/Aaa/users' ).to route_to( :controller => 'users', :action => 'index', :cityname => 'Aaa', :locale => 'en' )
      expect( :get => '/en/cities/travel-to/Aaa/users/page/9' 
              ).to route_to( :controller => 'users', :action => 'index', :cityname => 'Aaa', :locale => 'en', :users_page => '9' )
    end

    it 'venues' do
      expect( :get => '/en/cities/travel-to/Aaa/venues'
              ).to route_to( :controller => 'venues', :action => 'index', :cityname => 'Aaa', :locale => 'en' )
      expect( :get => '/en/cities/travel-to/Aaa/venues/page/5' 
              ).to route_to( :controller => 'venues', :action => 'index', :cityname => 'Aaa', :locale => 'en', :venues_page => '5' )
    end

  end

end
