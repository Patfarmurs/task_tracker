source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"
gem 'sassc-rails'
gem "cssbundling-rails"
gem "rails", "~> 7.1.3"
gem "pg", "~> 1.6"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "bootsnap", ">= 1.4.4", require: false

gem 'tzinfo-data'

# Our custom gems
gem "devise"                    # Authentication
gem "image_processing", "~> 1.2"  # Image handling
gem 'bootstrap', '~> 5.2'      # Bootstrap CSS
gem 'jquery-rails'              # jQuery for Bootstrap

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
end

group :production do
  gem 'rails_12factor'
end