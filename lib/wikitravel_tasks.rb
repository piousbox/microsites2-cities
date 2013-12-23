require 'rubygems'
require 'open-uri'
require 'htmlentities'
require 'string'

class WikitravelTasks

  def initialize args = {}
    args[:lang] ||= 'en'
    args[:domain] ||= 'travel-guide.mobi'

    @site = Site.where( :domain => args[:domain], :lang => args[:lang] ).first
    @user = self.find_or_create_wiki_user
  end

  def all_pages_to_report_and_newsitems
    WikitravelPage.all.each do |page|
      report = Report.where( :name => page[:title] ).first
      if report.blank?
        one_page_to_report_and_newsitems( page )
      else
        puts "Report already exists: #{report.name}"
      end
    end
  end

  def random_page_to_newsitem
    # select a random page
    begin
      n_pages = WikitravelPage.all.length
      random_page = WikitravelPage.all[rand(n_pages-1)]
      existing_report = Report.where( :name => random_page.title ).first
    end while !existing_report.blank?

    one_page_to_report_and_newsitems( random_page )
  end

  #
  # all the wikitravel.org stuff should belong to this user.
  #
  def find_or_create_wiki_user
    u = User.where( :username => 'wikitraveler' ).first
    if u.blank?
      u = User.create({ :username => 'wikitraveler', :name => 'Wikitraveler', :email => 'wiki@traveler.com', 
                        :password => 'omg such password you will never guess wow' })
    end
    return u
  end

  #
  # Take manually precompiled list of pages off of wikitravel.org, and create a WikitravelPage for each one that does not exist.
  #
  def self.parse_list_of_pages arg = {}
    arg[:filename] ||= 'wikitravel.org-popular-pages.htm'
    puts "Attn. parsing wikitravel.org list of pages with filename '#{arg[:filename]}'"

    index_html_path = Rails.root.join( 'data', arg[:filename] )
    page = Nokogiri::HTML(open(index_html_path))
    links = page.css( "ol.special li > a" )
    links.each do |link|
      unless link['href'].include?(':')
        page = WikitravelPage.new :url => link['href'], :title => link['title']
        if page.save
          puts "Saving page '#{page.title}'"
        else
          puts "Maybe the page '#{page.title}' already exists."
        end
      end
    end
  end

  private

  def one_page_to_report_and_newsitems random_page
    urll = "#{WikitravelPage::DOMAIN}#{random_page.url}"
    # puts! urll
    remote_page = Nokogiri::HTML( open( urll ) )
    text = remote_page.css("#mw-content-text tr > td")
    subhead = remote_page.css("#mw-content-text tr > td p")[0].text
    
    # create the report
    r = Report.new
    r.name = random_page.title
    r.name_seo = random_page.title.to_simple_string
    r.subhead = subhead
    r.descr = text
    r.site = @site
    r.user = @user
    r.save || puts!(r.errors)
    
    # create newsitem for the site
    n = Newsitem.new
    n.report = r
    @site.newsitems << n
    @site.save || puts!(site.errors)

    # create newsitem for the city
    nn = Newsitem.new
    nn.report = r
    city = City.where( :name => /#{r.name}/i ).first

    unless city.blank?
      city.newsitems << nn
      city.save
    end

  end

end

def puts! args
  puts '+++ +++'
  puts args.inspect
end



