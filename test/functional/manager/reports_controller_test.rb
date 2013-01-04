
require 'test_helper'

class Manager::ReportsControllerTest < ActionController::TestCase
  
  setup do
    User.all.each { |u| u.remove }
    Report.all.each { |r| r.remove }
    Tag.all.each { |u| u.remove }
    
    @user = FactoryGirl.create :user
    @admin = FactoryGirl.create :admin
    @manager = FactoryGirl.create :manager
    
    @r = FactoryGirl.create :report
    @r1 = FactoryGirl.create :r1
    @r2 = FactoryGirl.create :r2
    @r3 = FactoryGirl.create :r3

    @cac_tag = FactoryGirl.create :tag_cac

    sign_in :user, @manager
  end

  test 'create, sets user' do
    name_seo = 'bbasfasf'
    r = { :name => 'blah', :name_seo => name_seo, :username => @manager.username, :user_id => @manager.id }
    post :create, :report => r

    result = Report.where( :name_seo => name_seo ).first
    assert_not_nil result
    assert_equal @manager, result.user
  end

  test 'get reports of no-city' do
    get :index, :report => { :city_id => '' }
    rs = assigns(:reports)
    rs.each do |r|
      assert_nil r.city
    end
    
  end

  test 'show' do
    get :show, :id => Report.first.id
    assert_response :success
  end
  
end
