ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'shoulda/matchers'
require 'factory_girl'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }


ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

FactoryGirl.definition_file_paths = [File.expand_path('../factories', __FILE__)]
FactoryGirl.find_definitions
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_base_class_for_anonymous_controllers = false

  config.order = "random"
  config.include Capybara::DSL

   DatabaseCleaner.strategy = :transaction

    config.before(:suite) do
      DatabaseCleaner.start
    end

    config.before(:each) do
    end

    config.after(:all) do
      DatabaseCleaner.clean
    end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
