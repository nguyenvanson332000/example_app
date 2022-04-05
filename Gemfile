source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.0"


gem "rails", "~> 6.1.4", ">= 6.1.4.1"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 5.0"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 5.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.7"
gem "rails-i18n"
gem "bootstrap-sass", "3.4.1"
gem "bootsnap", ">= 1.4.4", require: false
gem "mysql2", ">= 0.4.4"
gem "bcrypt", "3.1.13"
gem "config"
gem "faker"
gem "will_paginate", "3.1.8"
gem "bootstrap-will_paginate", "1.0.0"
gem "image_processing", "1.9.3"
gem "mini_magick", "4.9.5"
gem "active_storage_validations", "0.8.2"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :production do
  gem "pg", "~> 0.18"
  gem "rails_12factor", "~> 0.0.1"
end

group :development do
  gem "web-console", ">= 4.1.0"
  gem "rack-mini-profiler", "~> 2.0"
  gem "listen", "~> 3.3"
  gem "spring"
end

group :test do
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
