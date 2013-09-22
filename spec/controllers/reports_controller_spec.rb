require 'spec_helper'
describe ReportsController do
  before :each do
    Tag.all.each { |c| c.remove }
    
    User.all.each { |c| c.remove }
    @user = FactoryGirl.create :user
    @anon = FactoryGirl.create :anon

    City.all.each { |c| c.remove }
    @city = FactoryGirl.create :rio

    Report.all.each { |c| c.remove }
    @r1 = FactoryGirl.create :r1
    @r1.city = @city
    @r1.save
    
    @r9 = FactoryGirl.create :r9
    @r9.city = @city
    @r9.save

    sign_in @user
  end

  describe 'index' do
    it 'displays json index of reports, with usernames' do
      get :index, :format => :json
      response.should be_success
      body = JSON.parse(response.body)
      body.length.should > 1
      if 'username' != body[0]['username']
        body[0]['username'].should eql 'anon'
      end
    end
    
    it 'scopes by city' do
      get :index, :cityname => 'rio', :format => :json
      response.should be_success
      parsed_body = JSON.parse(response.body)
      assert parsed_body.length > 1
      parsed_body.each do |report|
        report['city_id'].should eq( @city._id.to_s )
      end
    end
  end

  describe 'show' do
    it 'renders layouts application' do
      get :show, :name_seo => @r1.name_seo, :layout => 'application'
      response.should be_success
    end
  end

  describe 'venues for the map' do
    it 'GETs the json of venues for the map' do
      get :venues, :name_seo => @r1.name_seo, :format => :json
      response.should be_success
    end
  end

end


