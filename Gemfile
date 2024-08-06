# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.4'

gem 'bcrypt'
gem 'bootsnap', require: false
gem 'devise', '>= 4.9.4'
gem 'dockerfile-rails', '>= 1.6.17', group: :development
gem 'importmap-rails'
gem 'jbuilder'
gem 'pagy'
gem 'pg'
gem 'puma'
gem 'rails', '>= 7.1.3.4'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 6.2.0'
  gem 'simplecov', require: false
end

group :development do
  gem 'byebug'
  gem 'pry-rails'
  gem 'rubocop', require: false
  gem 'rubocop-md', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rake', require: false
  gem 'rubocop-rspec', require: false
  gem 'web-console'
end
