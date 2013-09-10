
require 'spec_helper'

describe WelcomeController do

  render_views

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

      expect( :get => 'en/reports' ).to route_to( :controller => 'reports', :action => 'index', :locale => 'en' )
      expect( :get => 'en/reports/page/2' ).to route_to( :controller => 'reports', :action => 'index', :locale => 'en' )
      expect( :get => "en/reports/view/#{@report.name_seo}" ).to route_to( :controller => 'reports', :action => 'show', :locale => 'en' )
      expect( :get => 'en/reports/new' ).to route_to( :controller => 'reports', :action => 'new', :locale => 'en' )
      expect( :post => 'en/reports' ).to route_to( :controller => 'reports', :action => 'create', :locale => 'en' )
      expect( :get => 'en/reports/5/edit' ).to route_to( :controller => 'reports', :action => 'edit', :locale => 'en' )
      expect( :post => 'en/reports/5' ).to route_to( :controller => 'reports', :action => 'update', :locale => 'en' )

    end
  end

end
