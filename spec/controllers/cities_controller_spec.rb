require 'spec_helper'
describe CitiesController do
  render_views

  before :each do
    City.all.each { |u| u.remove }
    @city = FactoryGirl.create :sf
    @city.is_feature = true
    @city.save
    @rio = FactoryGirl.create :rio
    @rio.is_feature = true
    @rio.save
    @city_3 = FactoryGirl.create :maputo

    User.all.each { |f| f.remove }
    @user = FactoryGirl.create :user
    
    Report.all.each { |r| r.remove }
    @feature_pt_1 = FactoryGirl.create :feature_pt_1
    @feature_ru_1 = FactoryGirl.create :feature_ru_1
    @report = FactoryGirl.create :report

    Gallery.all.each { |g| g.remove }
    @gallery = FactoryGirl.create :gallery

    setup_photos
    @photo = Photo.all.first

    setup_cities

    verbosity = $-v
    $-v = nil
  end

  describe '#index' do
    it 'GETs english index' do
      get :index
      response.should be_success
      response.should render_template( 'empty' )
    end

    it 'GETs json' do
      City.all.each { |c| ( c.is_feature = true ) && c.save }
      get :index, :format => :json
      response.should be_success
      results = JSON.parse(response.body)
      results.length.should >= 1
      results.each_with_index do |item, idx|
        unless results.length == idx+1
          results[idx]['name'].should <= results[idx+1]['name']
        end
      end
    end
  end

  describe '#profile (show)' do
    it 'has reports, events, galleries' do
      get :profile, :cityname => @city.cityname, :format => :json
      response.should be_success
      result = JSON.parse( response.body )
      result['galleries'].should eql []
      result['events'].should eql []
      result['reports'].should eql []
    end
  end

end
