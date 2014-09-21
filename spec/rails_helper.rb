# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rails/mongoid'
require 'database_cleaner'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!

  config.include Mongoid::Matchers, type: :model
  config.include FactoryGirl::Syntax::Methods

  Capybara.javascript_driver = :webkit

  config.before :suite do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.orm = "mongoid"
  end

  config.before :each do
    DatabaseCleaner.clean
  end

  config.deprecation_stream = File.open('log/deprecations.log', 'w')
end
