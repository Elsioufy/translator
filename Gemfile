source 'https://rubygems.org'

ruby '2.4.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# RailsAdmin is a Rails engine that provides an easy-to-use interface for managing your data
gem 'rails_admin', '~> 1.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Official Sass port of Bootstrap 2 and 3.
gem 'bootstrap-sass', '~> 3.4.0'
gem 'sassc-rails', '>= 2.0.0'

# A gem to automate using jQuery with Rails
gem 'jquery-rails'

# A Rails helper for time tags that can be used with the jQuery Timeago plugin.
gem 'rails-timeago', '~> 2.0'

# Easily access (read and write) globalize translated fields without fiddling with locale
gem 'globalize-accessors'

# Rails observer
gem 'rails-observers'

# Pagination library for Rails, Sinatra, Merb, DataMapper, and more
gem 'will_paginate', '~> 3.1.0'

# To rename rails application
gem 'rename'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Ckeditor integration gem for rails
gem 'ckeditor'

# Rails I18n de-facto standard library for ActiveRecord model/data translation.
gem 'globalize'

# Classier solution for file uploads for Rails, Sinatra and other Ruby web frameworks
gem 'carrierwave'

# mini replacement for RMagick
gem 'mini_magick'

# Official AWS Ruby gem for Amazon Translate. This gem is part of the AWS SDK for Ruby.
gem 'aws-sdk-translate', '~> 1.0'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw]
  # RSpec for Rails-3+
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails'
  # A library for setting up Ruby objects as test data.
  gem 'factory_bot'
  # A library for generating fake data such as names, addresses, and phone numbers.
  gem 'faker'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'

  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'

  # Strategies for cleaning databases in Ruby. Can be used to ensure a clean state for testing.
  gem 'database_cleaner'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :jruby]
