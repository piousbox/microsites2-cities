require 'spec_helper'
describe SitesController do
  render_views

  before :each do
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

  describe '#show' do
    it 'json' do
      get :show, :domainname => @site.domain, :format => :json 
      response.should be_success
      result = JSON.parse( response.body )
      result.reports.should_not eql nil
    end
  end

end
