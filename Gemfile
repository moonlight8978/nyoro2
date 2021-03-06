source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1', '>= 5.1.4'
gem 'mysql2', '~> 0.4.9'
gem 'puma', '~> 3.10'
gem 'sass-rails'
gem 'autoprefixer-rails'
gem 'uglifier'
gem 'turbolinks'
gem 'bcrypt'

gem 'groupdate'
gem 'sidekiq'
gem 'sunspot_rails'
gem 'figaro'
gem 'kaminari'
gem 'devise'
gem 'active_model_serializers'
gem 'redis', '~> 3.3.5'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'faraday'
gem 'i18n'
gem 'carrierwave'
gem 'draper', '~> 3.0', '>= 3.0.1'
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'sunspot_solr'
end

group :development do
  gem 'rails-erd', require: false
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'bullet'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
