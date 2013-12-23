
require 'spec_helper'
require 'wikitravel_tasks'

describe 'wikitravel crawler test' do

  before :each do
    User.all.each { |u| u.remove }
    @anon = FactoryGirl.create :anon

    Report.clear

    # setup_sites
    Site.all.each { |s| s.remove }
    @site = FactoryGirl.create :travel_guide_mobi
    # @site = Site.where( :domain => 'travel-guide.mobi', :lang => :en ).first
    @site.class.should eql Site

    City.all.each { |c| c.remove }
    @city = FactoryGirl.create :maputo
    @city.class.should eql City

  end

  it 'random page to new report does not loop infinitely' do
    # assert false, 'todo'
  end

  it 'random page to new report, newsitem of site, newsitem of city.' do
    n_reports = @site.reports.length
    n_city_items = @city.newsitems.length
    n_site_items = @site.newsitems.length

    WikitravelTasks.random_page_to_newsitem( :domain => 'travel-guide.mobi' )

    Site.find(@site.id).newsitems.length.should eql( n_site_items + 1 )
    Site.find(@site.id).reports.length.should eql( n_reports + 1 )
    City.find(@city.id).newsitems.length.should eql( n_city_items + 1 )
  end

  it 'parse list of pages' do
    WikitravelPage.clear
    WikitravelPage.all.length.should eql 0
    [1, 2].each do
      # twice, because duplicates should be silently ignored.
      WikitravelTasks.parse_list_of_pages({ :filename => 'wikitravel.org-popular-pages-test.htm' })
      WikitravelPage.all.length.should eql 3
    end
  end

end
