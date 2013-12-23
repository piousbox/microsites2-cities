
require 'spec_helper'
require 'wikitravel_tasks'

class WikitravelTasksTest < ActiveSupport::TestCase

  before :each do
    User.all.each { |u| u.remove }
    @anon = FactoryGirl.create :anon

    Report.clear

    setup_sites

    City.all.each { |c| c.remove }
  end

  it 'random page to new report does not loop infinitely' do
    # assert false, 'todo'
  end

  it 'random page to new report, newsitem of site, newsitem of city.' do
    city = FactoryGirl.create :maputo
    @site = Site.where( :domain => 'travel-guide.mobi', :lang => :en ).first
    n_reports = @site.reports.length
    @site.newsitems.length.should eql 0
    city = City.where( :name => 'Maputo' ).first
    city.should_not eql nil
    n_city_items = city.newsitems.length
    n_site_items = @site.newsitems.length

    WikitravelTasks.random_page_to_newsitem
    Site.find(@site.id).newsitems.length.should eql( n_site_items+1 )
    Site.find(@site.id).reports.length.should eql( n_reports+1 )
    City.find(city.id).newsitems.length.should eql( n_city_items+1 )
  end

  it 'parse list of pages' do
    WikitravelPage.clear
    WikitravelPage.all.length.should eql 0
    WikitravelTasks.parse_list_of_pages 'wikitravel.org-popular-pages-test.htm'
    WikitravelPage.all.length.should eql 3
    # twice, because duplicates should be silently muted.
    WikitravelTasks.parse_list_of_pages 'wikitravel.org-popular-pages-test.htm'
    WikitravelPage.all.length.should eql 3
  end

end
