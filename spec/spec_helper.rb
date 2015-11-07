ENV['RACK_ENV'] = 'test'

require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require './app/data_mapper_setup'
require 'database_cleaner'

require File.join(File.dirname(__FILE__), '../app', 'app.rb')

Capybara.app = DataRecorder

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
