require 'spec_helper'
describe VenuesController do
  render_views
  before :each do
    City.all.each { |u| u.remove }
    @city = @sf = FactoryGirl.create :sf

    User.all.each { |r| r.remove }
    @user = FactoryGirl.create :user

    Report.all.each { |r| r.remove }
    @report = FactoryGirl.create :report

    Venue.all.each { |v| v.remove }
    @v = FactoryGirl.create :venue
    @venue = @v

    Gallery.all.each { |g| g.remove }
    @gallery = FactoryGirl.create :gallery
    @pi_gallery = FactoryGirl.create :pi_gallery
  end

  describe 'show' do
    it 'should show json' do
      @v.profile_photo.should eql nil
      get :show, :venuename => @v.name_seo, :format => :json
      response.should be_success
    end
  end

  describe 'index' do    
    it 'shows venues in-city' do
      city = City.all[0]
      get :index, :cityname => city.cityname, :format => :json
      response.should be_success
      result = JSON.parse( response.body )
      result.length.should >= 1
    end
  end

  describe 'news' do
    it 'should GET news' do
      get :news, :name_seo => @v.name_seo, :format => :json
      response.should be_success
      result = JSON.parse( response.body )
      result.length.should >= 1
    end
  end

end


