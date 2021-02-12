source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

gem "rails", "~> 6.1.2", ">= 6.1.2.1"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "webpacker", github: "rails/webpacker"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.7"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem "image_processing", "~> 1.2"
gem "bootsnap", ">= 1.4.4", require: false

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "pry-byebug"
  gem "pry-rails"
  gem "dotenv-rails"
  gem "standard"
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem 'awesome_print'
end

group :development do
  gem "web-console", ">= 4.1.0"
  gem "rack-mini-profiler", "~> 2.0"
  gem "listen", "~> 3.3"
  gem "letter_opener" # Opens emails in new tab for easier testing
end

group :test do
  gem "capybara"
  gem "capybara-screenshot"
  gem "selenium-webdriver"
  gem "webdrivers", require: false # Easy installation and use of web drivers to run system tests with browsers;
end

gem "active_record-events", "~> 4.0"
gem 'draper'
gem "simple_calendar"
gem 'rails-i18n'
gem 'faker'
gem "meta-tags", "~> 2.14"

gem "pagy", "~> 3.10"
