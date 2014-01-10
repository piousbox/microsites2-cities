require 'spec_helper'
describe Utils::SitemapsController do

  describe 'routes' do
    it 'sitemap' do
      expect( :get => '/sitemap.xml' ).to route_to( 'utils/sitemaps#sitemap', :format => 'xml' )
    end
  end

end


