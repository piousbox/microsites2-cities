
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
      expect( :get => 'en/galleries' ).to route_to( :controller => 'galleries', :action => 'index', :locale => 'en' )
      expect( :get => 'en/galleries/page/2' ).to route_to( :controller => 'galleries', :action => 'index', :locale => 'en', :galleries_page => '2' )
      expect( :get => "en/galleries/show/#{@gallery.galleryname}" ).to route_to(
        :controller => 'galleries', :action => 'show', :locale => 'en', :galleryname => @gallery.galleryname )
      expect( :get => "en/galleries/show/#{@gallery.galleryname}/2" ).to route_to( 
        :controller => 'galleries', :action => 'show', :locale => 'en', :galleryname => @gallery.galleryname, :photo_idx => '2' )
      expect( :get => "en/galleries/show_long/#{@gallery.galleryname}" ).to route_to(
        :controller => 'galleries', :action => 'show', :locale => 'en', :galleryname => @gallery.galleryname )
      expect( :get => "en/galleries/show_mini/#{@gallery.galleryname}" ).to route_to( 
        :controller => 'galleries', :action => 'show', :locale => 'en', :galleryname => @gallery.galleryname )
      expect( :get => 'en/galleries/new' ).to route_to( :controller => 'galleries', :action => 'new', :locale => 'en' )
      expect( :post => 'en/galleries' ).to route_to( :controller => 'galleries', :action => 'create', :locale => 'en' )
      expect( :get => 'en/galleries/5/edit' ).to route_to( :controller => 'galleries', :action => 'edit', :locale => 'en' )
      expect( :post => 'en/galleries/5' ).to route_to( :controller => 'galleries', :action => 'update', :locale => 'en' )
    end
  end

end
