require 'test_helper'
class TagsControllerTest < ActionController::TestCase
  setup do   
    setup_reports
    
    @request.host = 'test.host'
    setup_sites

    Tag.all.each { |t| t.remove }
    @tag_old = FactoryGirl.create :tag_old
    @tag_feature = FactoryGirl.create :tag_feature_1
    @tag_new = FactoryGirl.create :tag_new
    Tag.all.each { |t| t.site = @site; t.save }
  end
  
  test 'get show' do
    Tag.all.each { |t| t.remove }
    @tag = Tag.create :name => 'blah blah', :name_seo => 'name_1'
    
    get :show, :name_seo => @tag[:name_seo]
    assert_response :success
    assert_template :show
  end

  test 'get show displays no non-public galleries' do
    Tag.all.each { |t| t.remove }
    @sedux = Tag.create :name => 'Sedux', :name_seo => 'sedux'
    assert_equal 'Tag', @sedux.class.name

    # some non-public galleries for tag sedux
    Gallery.all.each { |g| g.remove }
    @g = Gallery.create :is_public => false, :tag => @sedux, :name => 'Blah Gallery', :descr => 'gallery descr'
    assert_equal 'Gallery', @g.class.name

    get :show, :name_seo => @sedux.name_seo
    assert_response :success

    galleries = assigns :galleries
    assert_equal 0, galleries.length
    galleries.each do |g|
      assert g.galleryname != @g.galleryname
    end
    
  end
  
  test "should get index" do
    get :index
    assert_response :success
    tags = assigns(:tags)
    assert tags.length > 0, "there are more than zero tags"

    feature_tags = assigns :feature_tags
    assert_not_nil feature_tags
    assert_equal 'Tag', feature_tags[0].class.name, "There is a feature tag"

  end
  
end
