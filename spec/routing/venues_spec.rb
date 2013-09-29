require 'spec_helper'
describe VenuesController do
  describe 'routes' do

    it 'general things' do
      expect( :get => '/en/venues' ).to route_to( :controller => 'venues', :action => 'index', :locale => 'en' )
      expect( :get => '/en/venues/page/3' ).to route_to( :controller => 'venues', :action => 'index', :venues_page => '3', :locale => 'en' )
      expect( :get => '/en/venues/show/Aaa' ).to route_to( :controller => 'venues', :action => 'show', :venuename => 'Aaa', :locale => 'en' )
    end

  end

end


