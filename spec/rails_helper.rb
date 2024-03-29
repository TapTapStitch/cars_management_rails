# frozen_string_literal: true

require 'simplecov'
SimpleCov.start
require 'spec_helper'
require 'devise'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
Dir["#{Dir.pwd}/spec/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.disable_monkey_patching!
  config.fixture_path = Rails.root.join('/spec/fixtures')

  config.include FactoryBot::Syntax::Methods

  config.use_transactional_fixtures = true
  config.before(:suite) do
    ActiveRecord::Base.connection.execute('TRUNCATE TABLE cars RESTART IDENTITY CASCADE;')
  end

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end
