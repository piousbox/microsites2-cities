
require 'test_helper'

class CitiesControllerTest < ActionController::TestCase
  
  setup do
    # @request.host = 'travel.local' 
    @request.host = 'piousbox.com'   

    User.all.each { |u| u.remove }
    @user = FactoryGirl.create :user

    setup_photos
    @photo = Photo.all.first

    setup_cities

    verbosity = $-v
    $-v = nil

    setup_sites
  end
  
  test 'get profile' do
    get :profile, :cityname => 'San_Francisco', :locale => :en
    assert_response :success
    assert_template :profile
    assert_template :cities
    
    city = assigns :city
    assert_not_nil city

    reports = assigns :reports
    reports.each do |r|
      assert_equal r.is_trash, 0
    end
    
  end
  
  test 'json for profile' do
    get :profile, :cityname => 'rio', :format => :json
    assert_response :success
    
    city = assigns(:city)
    assert_not_nil city
    assert_equal 'calendar', city[:calendar_frame]
    
  end
  
  test 'get index' do
    get :index, :locale => :en
    assert_response :success
    assert_template :index
    assert_template :cities
    
    cities = assigns :cities
    assert_not_nil cities
    
    feature_cities = assigns :feature_cities
    assert_not_nil feature_cities
    
  end
  
end
