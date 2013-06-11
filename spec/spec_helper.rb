ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

require 'capybara/rails'
require 'capybara/rspec'

require 'test/unit'
require 'mocha/setup'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

include Warden::Test::Helpers

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  # config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
  
  config.include Devise::TestHelpers, :type => :controller

  config.around( :each, :caching ) do |example|
    caching = ActionController::Base.perform_caching
    ActionController::Base.perform_caching = example.metadata[:caching]
    example.run
    Rails.cache.clear
    ActionController::Base.perform_caching = caching
  end

end

Paperclip.options[:log] = false
Mocha::Deprecation.mode = :disabled
  
def puts! args
  puts '+++ +++'
  puts args.inspect
end

class ActionController::TestCase
  include Devise::TestHelpers
  Paperclip.options[:log] = false
  Mocha::Deprecation.mode = :disabled
end

def setup_users
  User.all.each { |c| c.remove }
  @user = FactoryGirl.create :user
  @anon = FactoryGirl.create :anon
  @simple = FactoryGirl.create :simple
  @user_2 = FactoryGirl.create :user_2
  @manager = FactoryGirl.create :manager
  @piousbox = FactoryGirl.create :piousbox
end

def setup_cities
  City.all.each { |c| c.remove }
  @sf = FactoryGirl.create :sf
  @rio = FactoryGirl.create :rio
  @nyc = FactoryGirl.create :nyc
end

def setup_sites
  Site.all.each { |s| s.remove }
  FactoryGirl.create :test_site
  FactoryGirl.create :site_piousbox
  FactoryGirl.create :site_piousbox_ru
  FactoryGirl.create :site_piousbox_pt
end

