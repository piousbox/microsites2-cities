
require 'spec_helper'
require 'wikitravel_tasks'

describe 'wikitravel crawler test' do

  before :each do
    User.all.each { |u| u.remove }
    @anon = FactoryGirl.create :anon

    Report.clear

    Site.all.each { |s| s.remove }
    @site = FactoryGirl.create :travel_guide_mobi

    City.all.each { |c| c.remove }
    @city = FactoryGirl.create :maputo
    @city.class.should eql City
    
    @w = WikitravelTasks.new :site => @site
  end

  it 'random page to new report, newsitem of site, newsitem of city.' do
    n_reports = @site.reports.length
    n_site_items = Site.find(@site.id).newsitems.length

    @w.random_page_to_newsitem

    Site.find(@site.id).newsitems.length.should eql( n_site_items + 1 )
    Site.find(@site.id).reports.length.should eql( n_reports + 1 )
  end

  it '#one page to report and newsitems - creates newsitems for city' do
    n_city_items = @city.newsitems.length
    City.all.length.should > 0

    @w.one_page_to_report_and_newsitems( WikitravelPage.where( :title => 'Maputo' ).first )
    
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

  it '#find_or_create_wiki_user' do
    User.all.each { |u| u.remove }
    User.all.length.should eql 0
    [1,2,3].each do |i|
      # should not create if already exists
      WikitravelTasks.find_or_create_wiki_user
      User.all.length.should eql 1
    end
  end

  it '#all_pages_to_reports_and_newsitems' do
    WikitravelTasks.parse_list_of_pages({ :filename => 'wikitravel.org-popular-pages-test.htm' })
    WikitravelPage.all.length.should > 0

    w = WikitravelTasks.new :filename => 'wikitravel.org-popular-pages-test.htm'
    w.all_pages_to_report_and_newsitems

    # so, each page should have a corresponding report.
    WikitravelPage.each do |page|
      r = Report.where( :name => page.title ).first
      r.class.should eql Report
      r.tag.name.should eql @w.travel_tag.name
    end
  end

  it 'find or create travel tag' do
    Tag.unscoped.each { |t| t.remove }
    [1,2,3].each do |i|
      # convergent
      t = @w.travel_tag
      Tag.all.length.should eql 1
      Tag.all.first.name.should eql 'Travel'
    end
  end

end
