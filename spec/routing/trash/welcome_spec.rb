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

  describe 'routes' do
    it 'homepage and cities index' do
      # expect( :get => '/' ).to route_to( :controller => 'welcome', :action => 'home' )
      expect( :get => '/en/' ).to route_to( :controller => 'cities', :action => 'index', :locale => 'en' )
      expect( :get => '/en/cities' ).to route_to( :controller => 'cities', :action => 'index', :locale => 'en' )
      expect( :get => '/cities.json').to route_to('cities#index', 'format' => 'json')
      expect( :get => '/en/cities.json').to route_to('cities#index', 'format' => 'json', :locale => 'en' )

    end

    it 'aux' do
      expect( :get => '/en/about' ).to route_to( :controller => 'welcome', :action => 'about', :locale => 'en' )
      expect( :get => '/en/contact' ).to route_to( :controller => 'welcome', :action => 'contact', :locale => 'en' )
      expect( :get => '/en/privacy' ).to route_to( :controller => 'welcome', :action => 'privacy', :locale => 'en' )
      expect( :get => '/en/help' ).to route_to( :controller => 'welcome', :action => 'help', :locale => 'en' )
    end

  end

end
