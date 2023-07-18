# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

gem 'rails', '~> 7.0.4', '>= 7.0.4.2'
gem 'devise', '>= 4.8.1'
gem 'sprockets-rails'
gem 'pg'
gem 'puma'
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'jbuilder'
gem 'bcrypt', '~> 3.1.7'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'bootsnap', require: false
gem 'pagy'
gem 'dockerfile-rails', '>= 1.0.0', group: :development

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'rubocop-rspec'
  gem 'simplecov', require: false
  gem 'shoulda-matchers', '~> 5.0'
end

group :development do
  gem 'web-console'
  gem 'pry-rails'
  gem 'byebug'
  gem 'rubocop-rails'
  gem 'rubocop-performance'
end
