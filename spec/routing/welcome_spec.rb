require 'spec_helper'
describe WelcomeController do
  before :each do
    User.all.each { |f| f.remove }
    @user = FactoryGirl.create :user

    Gallery.all.each { |g| g.remove }
    @gallery = FactoryGirl.create :gallery

    Report.all.each { |r| r.remove }
    @report = FactoryGirl.create :report

  end

  describe 'Welcome Guest' do
    it 'GETs homepage' do
      get :home
      response.should be_redirect
      response.should redirect_to( '/en/sites/piousbox.com.html' )
    end
  end

  describe 'routes' do
    it 'routes' do
      expect( :get => '/' ).to route_to( :controller => 'welcome', :action => 'home' )
      expect( :get => 'en/features' ).to route_to( :controller => 'sites', :action => 'features', :locale => 'en' )
      expect( :get => 'en/newsitems' ).to route_to( :controller => 'sites', :action => 'newsitems', :locale => 'en' )
      expect( :get => 'en/features/page/2' ).to route_to( :controller => 'sites', :action => 'features', :locale => 'en', :features_page => '2' )
      expect( :get => 'en/newsitems/page/2' ).to route_to( :controller => 'sites', :action => 'newsitems', :locale => 'en', :newsitems_page => '2' )

      expect( :get => 'en/users' ).to route_to( :controller => 'users', :action => 'index', :locale => 'en' )
      expect( :get => 'en/users/show/piousbox' ).to route_to( :controller => 'users', :action => 'show', :locale => 'en' )
      expect( :get => 'en/en/users/show/piousbox' ).to route_to( :controller => 'users', :action => 'show', :locale => 'en' )
      expect( :get => 'en/users/new' ).to route_to( :controller => 'users', :action => 'new', :locale => 'en' )

      expect( :get => 'en/photos/new' ).to route_to( :controller => 'photos', :action => 'new', :locale => 'en' )
      expect( :post => 'en/photos' ).to route_to( :controller => 'photos', :action => 'create', :locale => 'en' )

      expect( :get => 'en/manager/edit-settings' ).to route_to( :controller => 'manager', :action => 'edit_settings', :locale => 'en' )
      expect( :post => 'en/manager/edit-settings' ).to route_to( :controller => 'manager', :action => 'update_settings', :locale => 'en' )
      expect( :post => 'en/manager/features' ).to route_to( :controller => 'manager', :action => 'features_create', :locale => 'en' )
      expect( :post => 'en/manager/clear-cache' ).to route_to( :controller => 'manager', :action => 'clear_cache', :locale => 'en' )
    end
  end

end
