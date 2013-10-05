require 'spec_helper'
describe SitesController do
  describe 'routes' do
    it 'routes #show.json' do
      expect( :get => '/en/sites/travel-guide.mobi.json' 
              ).to route_to( :controller => 'sites', :action => 'show', :locale => 'en', :domainname => 'travel-guide.mobi', :format => :json )
    end

  end

end
