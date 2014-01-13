require 'spec_helper'
describe GalleriesController do
  before :each do
    Photo.all.each { |ph| ph.remove }

    Report.all.each { |c| c.remove }

    Tag.all.each { |c| c.remove }
    @tag = FactoryGirl.create :tag
    
    User.all.each { |c| c.remove }
    @user = FactoryGirl.create :user
    @piousbox = FactoryGirl.create :piousbox

    City.all.each { |c| c.remove }
    @city = FactoryGirl.create :rio

    Gallery.all.each { |g| g.remove }
    @g = FactoryGirl.create :gallery
    @g.city = City.all.first
    @g.save
    @g1 = FactoryGirl.create :g1
    @g2 = FactoryGirl.create :g2

    photos = Photo.all[0...4]
    photos.each do |photo|
      photo.gallery = @g
      photo.save
    end

    @ph1 = Photo.create :user => @user, :name => 'ph1'
    @ph2 = Photo.create :user => @user, :name => 'ph2'
    @ph3 = Photo.create :user => @user, :name => 'ph3'

  end

  proc do # hidden
  describe 'not found' do
    it 'should display gallery-not-found' do
      Gallery.where( :galleryname => 'g' ).each { |g| g.remove }
      get :show, :galleryname => 'g', :locale => :en
      response.should be_redirect
    end
  end
  describe 'show' do
    it 'json 200' do
      get :show, :galleryname => 'g', :locale => :en, :format => :json
      response.should be_success
      # body = JSON.parse( response.body )
      # body.lenght.should >= 1
    end
    it 'html redirect' do
      get :show, :galleryname => @g.galleryname, :locale => :en, :format => :html
      response.should be_redirect
      response.should redirect_to( "http://piousbox.com/en/galleries/show/#{@g.galleryname}/0" )
    end
  end
  end

  describe 'new' do
    it 'GETs' do
      get :new, :locale => :en
      response.should be_success
      response.should render_template( 'galleries/new' )
    end
  end

end
