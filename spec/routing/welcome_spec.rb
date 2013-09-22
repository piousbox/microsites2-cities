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
    it 'routes' do
      # expect( :get => '/' ).to route_to( :controller => 'welcome', :action => 'home' )
      expect( :get => '/en/' ).to route_to( :controller => 'cities', :action => 'index', :locale => 'en' )
      expect( :get => '/en/cities' ).to route_to( :controller => 'cities', :action => 'index', :locale => 'en' )
      expect( :get => '/cities.json').to route_to('cities#index', 'format' => 'json')
      expect( :get => '/en/cities.json').to route_to('cities#index', 'format' => 'json', :locale => 'en' )

    end
  end

end
