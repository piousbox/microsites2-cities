require 'wikitravel_tasks'
namespace :wikitravel do
  
  desc "deprecated? Usage: be rake wikitravel:random_page_to_newsitem domain='mobi.local'"
  task :random_page_to_newsitem => :environment do
    # takes too long
    WikitravelTasks.parse_list_of_pages
    
    w = WikitravelTasks.new
    w.random_page_to_newsitem({ :domain => ENV['domain'] })
  end
  
  desc "Take manually precompiled list of pages off of wikitravel.org, and create a WikitravelPage for each one that does not exist."
  task :parse_list_of_pages => :environment do
    arguments = { :filename => ENV['filename'] }
    w = WikitravelTasks.new arguments
    w.parse_list_of_pages arguments
  end

end

