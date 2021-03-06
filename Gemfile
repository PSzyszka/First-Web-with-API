source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

gem 'sprockets-rails', '~> 3.2.1'
gem 'dotenv-rails'
gem 'faraday'
gem 'oauth2'
gem 'rest-client'
gem 'bootstrap', '~> 4.0.0'
gem 'jquery-rails'
gem 'dotenv-rails', groups: [:development, :test]
gem 'loofah', '~> 2.2.1'
gem 'nokogiri', '~> 1.8.2'
gem 'rails-html-sanitizer', '~> 1.0.4'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # For code debugging
  gem 'pry', '~> 0.10'
  gem 'pry-rails', '~> 0.3'
  gem 'pry-byebug', '~> 3.1'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'rspec-rails', '~> 3.6'
  gem 'timecop', '~> 0.9.1'
  gem 'rails-controller-testing'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
