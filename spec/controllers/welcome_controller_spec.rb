require 'spec_helper'
describe WelcomeController do
  render_views
  before :each do
    City.all.each { |u| u.remove }
    @sf = FactoryGirl.create :sf
    @sf.profile_photo = Photo.new
    @sf.save
    @rio = FactoryGirl.create :rio
    @rio.profile_photo = Photo.new
    @rio.save
    
    User.all.each { |f| f.remove }
    @user = FactoryGirl.create :user

    @request.host = 'piousbox.com'
    @request.env['HTTP_REFERER'] = 'test.host/about'
  end

  describe 'header' do
    it 'lets you select from only feature cities' do
      @request.host = 'piousbox.com'
      get :about
      length = assigns(:list_citynames).length
      assigns( :list_citynames )[1...length].each do |city|
        city.is_feature.should eql true
      end
      # this test is bullshit by the way
    end
  end

  describe 'aux' do
    it 'GETs help' do
      get :help
      response.should be_success
      response.should render_template( 'welcome/help' )
    end

    it 'GETs privacy' do
      get :privacy
      response.should be_success
      response.should render_template( 'welcome/privacy' )
    end

    it 'GETs contact' do
      get :contact
      response.should be_success
      response.should render_template( 'welcome/contact' )
    end

    it 'GETs about' do
      get :about
      response.should be_success
      response.should render_template( 'welcome/about' )
    end
  end

  describe 'exctact layout' do
    it 'sets application layout' do
      hosts = [ 'test.host' ]
      hosts.each do |host|
        @request.host = host
        get :about
        response.should render_template('layouts/cities')
      end
    end

    it 'sets mobile layout' do
      hosts = [ 'm.test.com' ]
      hosts.each do |host|
        @request.host = host
        get :about
        response.should render_template('layouts/cities')
      end
    end
  end

  describe 'home' do
    it 'should redirect to sites/show' do
      get :home
      response.should be_redirect
    end

    it 'should redirect to travel for travel' do
      @request.host = 'travel-guide.mobi'
      get :home
      response.should be_redirect
      response.should redirect_to('/en/cities')
    end
  end

  it '#meta' do
    get :meta
    response.should be_success
  end

end
