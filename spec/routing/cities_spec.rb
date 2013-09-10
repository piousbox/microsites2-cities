
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
      expect(:get => '/cities.json').to route_to('cities#index', 'format' => 'json')
    end
  end
end
