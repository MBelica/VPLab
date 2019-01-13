source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
# Provides Sprockets implementation for Rails 4.x (and beyond) Asset Pipeline.
gem 'sprockets-rails', :require => 'sprockets/railtie'
# Use sqlite3 during development and Postgresql during production as the database for Active Record
group :development do
  gem 'sqlite3'
end
group :test, :production do
  gem 'pg'
end
# Use Puma as the app server
gem 'puma'
# Use orSCSS for stylesheets
gem 'sass-rails'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

# Use devise to flexibly authenticate based on Warden.
gem 'devise'
# An authorization library
gem 'cancancan'
# Letting devise register auth through shibboleth
gem 'omniauth' # todo implement

# jQuery as a JavaScript library. Bootstrap depends on it
gem 'jquery-rails'
# Bootstrap 4 ruby gem for a resposive front-end component library.
gem 'bootstrap'

# Breadcrumbs
gem 'breadcrumbs_on_rails'
# Generates attr_accessors that transparently encrypt and decrypt attributes.
gem 'attr_encrypted'
# Blind indexing for increased user security.
gem 'blind_index'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # To increase performance by suggesting query improvements
  gem 'bullet'
  # Use Capistrano for deployment
  gem 'capistrano-rails'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console'
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'
  # Replacing the standard Rails error page with a much better and more useful error page
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end