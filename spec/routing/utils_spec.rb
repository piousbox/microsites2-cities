require 'spec_helper'
describe UtilsController do

  describe 'routes' do
    it 'sitemap' do
      expect( :get => '/sitemap.xml' ).to route_to( 'utils#sitemap' )
    end
  end

end


