# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

dummy_dir = File.expand_path(File.join(File.dirname(__FILE__), "dummy"))
rails_dir = File.expand_path(File.join(File.dirname(__FILE__), "rails"))
rails_dummy_dir = rails_dir + "/dummy"
FileUtils.cp_r dummy_dir, rails_dir
require rails_dummy_dir + "/config/environment.rb"
require "rails/test_help"
require "rails/generators/test_case"
require "capybara/rails"
require "database_cleaner"
require "timecop"
require "generators/authpro/authpro_generator"
require "securerandom"

Rails.backtrace_cleaner.remove_silencers!

DatabaseCleaner.strategy = :truncation

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  self.use_transactional_fixtures = false

  teardown do
    DatabaseCleaner.clean
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end

def fake_email
  "#{SecureRandom.urlsafe_base64}@sample.com"
end
