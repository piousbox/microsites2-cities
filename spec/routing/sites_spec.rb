require 'spec_helper'

DEFAULT_OPTIONS = { :locale => 'en', :domainname => 'travel-guide.mobi', :format => :json}

describe SitesController do

  it 'routes' do
    expect( :get => '/en/sites/travel-guide.mobi.json' ).to route_to( 'sites#show', DEFAULT_OPTIONS )
    expect( :get => '/en/sites/travel-guide.mobi/galleries.json' ).to route_to( 'sites#galleries', DEFAULT_OPTIONS )
  end
  
end
