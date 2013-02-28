
require 'spec_helper'

describe VenuesController do

  before :each do
    City.all.each { |u| u.remove }
    City.create :name => 'San Francisco', :cityname => 'San_Francisco'

    User.all.each { |r| r.remove }
    @user = FactoryGirl.create :user

    Venue.all.each { |v| v.remove }
    @v = FactoryGirl.create :venue
  end

  describe 'show' do
    it 'should show json' do
      @v.profile_photo.should eql nil
      get :show, :name_seo => @v.name_seo, :format => :json
      response.should be_success
    end

    it 'should show html' do
      @v.profile_photo.should eql nil
      @v.name_seo.should_not eql nil
      get :show, :name_seo => @v.name_seo
      response.should be_success
      response.should render_template('venues/show')
    end
  end

  describe 'index' do
    it 'should' do
      get :index
      response.should be_success
      vs = assigns(:venues)
      vs.length.should be > 0
    end

    it 'shows venues in-city' do
      city = City.all[0]
      get :index, :cityname => city.cityname
      response.should render_template('venues/index')
      assigns(:venues).each do |venue|
        venue.city.cityname.should eql city.cityname
      end
    end

    it 'should should only for a city' do
      get :index, :cityname => 'San_Francisco'
      vs = assigns(:venues)
      vs.each do |v|
        v.city.name.should eql 'San Francisco'
      end
    end
  end

  describe 'news' do
    it 'should GET news' do
      get :news, :name_seo => @v.name_seo
      response.should be_success
      response.should render_template('venues/news')
      assigns( :newsitems ).should_not eql nil
    end
  end

  describe 'create' do
    it 'should GET new' do
      sign_in :user, @user
      get :new
      response.should be_success
      response.should render_template('venues/new')
    end

    it 'creates in city, with x, y, name, is_public' do
      sign_in :user, @user
      city = City.all[0]
      venue = { :x => '1.0', :y => '2.0', :is_public => true, :city_id => city.id, :name => 'Name is required' }
      put :create, :venue => venue
      response.should be_redirect

      result = Venue.where( :name => venue[:name] ).first
      result.class.name.should eql 'Venue'
      result.user.username.should eql @user.username
      result.x.to_s.should eql venue[:x]
      result.y.to_s.should eql venue[:y]
      result.is_public.should eql true
      result.city.cityname.should eql city.cityname
    end
  end
  
end
