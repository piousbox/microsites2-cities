require 'spec_helper'
describe VideosController do
  before :each do
    City.all.each { |u| u.remove }
    @sf = FactoryGirl.create :sf

    User.all.each { |r| r.remove }
    @u = FactoryGirl.create :user

    Video.all.each { |v| v.remove }
    @v1 = FactoryGirl.create :v1
    @v2 = FactoryGirl.create :v2
    @v3 = FactoryGirl.create :v3
  end

  describe 'index' do
    it 'should should only for a city' do
      get :index, :cityname => 'San_Francisco', :format => :json
      response.should be_success
    end
  end

end
