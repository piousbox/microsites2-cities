
require 'spec_helper'

describe 'angular router.partial_compiled()' do

  it 'events' do
    expect( :get => '/en/events/new' ).to route_to( 'events#new', :locale => 'en' )
  end

  it 'galleries' do
    expect( :get => '/en/galleries/new' ).to route_to( 'galleries#new', :locale => 'en' )
  end

  it 'photos' do
    expect( :get => '/en/photos/new' ).to route_to( 'photos#new', :locale => 'en' )
  end

  it 'reports' do
    expect( :get => '/en/reports/new' ).to route_to( 'reports#new', :locale => 'en' )
  end

  it 'reviews' do
    expect( :get => '/en/reviews/new' ).to route_to( 'reviews#new', :locale => 'en' )
  end
  
  it 'venues' do
    expect( :get => '/en/venues/new' ).to route_to( 'venues#new', :locale => 'en' )
  end

end
