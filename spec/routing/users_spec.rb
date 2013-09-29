require 'spec_helper'
describe UsersController do

  describe 'routes' do
    it 'users' do
      expect( :get = > '/en/users' ).to route_to( :controller => 'users', :action => 'index', :locale => 'en' )
      expect( :get = > '/en/users/show/Uuu' ).to route_to( :controller => 'users', :action => 'show', :username => 'Uuu', :locale => 'en' )
    end
  end

end
