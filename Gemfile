source "https://rubygems.org"

ruby "2.6.3"

gem "rails", "~> 5.2.2"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.11"
gem "sass-rails", "~> 5.0"
gem "coffee-rails", "~> 4.2"
gem "uglifier", ">= 1.3.0"
gem "bootsnap", ">= 1.1.0", require: false
gem "rack-canonical-host"
gem "webpacker", "~> 3.5"

# For memory profiling
gem "rack-mini-profiler", require: false

# CSS frameworks
gem "normalize-rails"
gem "alom"
gem "autoprefixer-rails"

gem 'devise'

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "spring-commands-rspec"
  gem "bundler-audit", ">= 0.5.0", require: false
  gem "annotate"
end

# Test gems
group :test do
  gem "shoulda-matchers"
  # Generate test coverage reports:
  gem "simplecov", "~> 0.16.1", require: false
  # Format test coverage reports for console output:
  gem "simplecov-console", "~> 0.4.2", require: false
  gem "simplecov-json", require: false
  gem "simplecov-reporter", require: false
end

group :development, :test do
  gem "bullet"
  gem "pry"
  gem "factory_bot_rails"
  gem "rspec-rails", "~> 3.8"
  gem "ffaker"
  gem 'httparty'
  gem 'webmock'
  gem 'vcr'

  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 2.15", "< 4.0"
  gem "selenium-webdriver"
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem "chromedriver-helper"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
