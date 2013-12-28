require 'spec_helper'
describe CitiesController do

  it 'cities' do
    expect( :get => '/cities.json' ).to route_to( :controller => 'cities', :action => 'index', :format => 'json' )
    expect( :get => '/cities/travel-to/Aaa.json' ).to route_to( :controller => 'cities', :action => 'profile', :cityname => 'Aaa', :format => 'json' )
    expect( :get => '/en/cities.json' ).to route_to( :controller => 'cities', :action => 'index', :format => 'json', :locale => 'en' )
    expect( :get => '/en/cities/travel-to/Aaa.json' ).to route_to( :controller => 'cities', :action => 'profile', :cityname => 'Aaa', 
                                                                   :format => 'json', :locale => 'en' )
  end
  
  it 'reports' do
    expect( :get => '/reports.json' ).to route_to( :controller => 'reports', :action => 'index', :format => 'json' )
    expect( :get => '/reports/view/blah.json').to route_to({ :controller => 'reports', :action => 'show', :name_seo => 'blah', :format => 'json' })
    expect( :get => '/pt/reports.json' ).to route_to( :controller => 'reports', :action => 'index', :format => 'json', :locale => 'pt' )
    expect( :get => '/pt/reports/view/blah.json').to route_to({ :controller => 'reports', :action => 'show', :name_seo => 'blah', 
                                                                :format => 'json', :locale => 'pt' })
  end

  it 'venues' do
    expect( :get => '/venues.json' ).to route_to( :controller => 'venues', :action => 'index', :format => 'json' )
    expect( :get => '/venues/show/blah.json').to route_to({ :controller => 'venues', :action => 'show', :name_seo => 'blah', :format => 'json' })
    expect( :get => '/pt/venues.json' ).to route_to( :controller => 'venues', :action => 'index', :format => 'json', :locale => 'pt' )
    expect( :get => '/pt/venues/show/blah.json').to route_to({ :controller => 'venues', :action => 'show', :name_seo => 'blah', 
                                                          :format => 'json', :locale => 'pt' })
  end

  it 'users' do
    expect( :get => '/en/users.json' ).to route_to( :controller => 'users', :action => 'index', :locale => 'en', :format => 'json' )
    expect( :get => '/en/users/show/Uuu.json' ).to route_to( :controller => 'users', :action => 'show', :username => 'Uuu',
                                                             :locale => 'en', :format => 'json' )
  end

end
