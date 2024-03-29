# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.1"

# Use sqlite3 as the database for Active Record
gem "sqlite3", "~> 1.4"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false
gem "aasm", "~> 5.2"
gem "after_commit_everywhere", "~> 1.0"
gem "phonelib"
gem "valid_email2"

gem "activeadmin"

# Plus integrations with:
gem "devise"
gem "cancancan"
gem "draper"
gem "pundit"
gem "sprockets"
gem "sass-rails"
# gem 'csv-importer'
gem "rswag-api"
gem "rswag-ui"
gem "active_decorator"
gem "caxlsx"
gem "caxlsx_rails"
gem "dotenv-rails", groups: [:development, :test]
gem "awesome_print"
gem "hirb"
gem "unicode-display_width", "~> 2.4", ">= 2.4.2"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem "rack-cors"
gem "prawn"
gem "prawn-qrcode", github: "nukturnal/prawn-qrcode"
gem "prawn-table"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails"
  gem "rswag-specs"
  gem "factory_bot"
  gem "factory_bot_rails"
  gem "database_cleaner"
  gem "simplecov", require: false
  # gem "rubycritic", require: false
  gem "letter_opener"
  gem "letter_opener_web", "~> 2.0"
  gem "pry-rails"
  gem "pdf-reader"
  gem "database_cleaner-active_record"
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem "annotate"
  gem "faker", git: "https://github.com/faker-ruby/faker.git", branch: "main"
  gem "rswag"
  gem "rubocop", require: false
  gem "standard", require: false
end

gem "sidekiq", "~> 6.5"
gem "paper_trail"
