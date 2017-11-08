source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1', '>= 5.1.4'
gem 'mysql2', '~> 0.4.9'
gem 'puma', '~> 3.10'
gem 'sass-rails', '~> 5.0', '>= 5.0.6'
gem 'autoprefixer-rails', '~> 7.1', '>= 7.1.6'
gem 'uglifier', '~> 3.2'
gem 'turbolinks', '~> 5.0', '>= 5.0.1'
gem 'bcrypt', '~> 3.1', '>= 3.1.11'
gem 'groupdate', '~> 3.2'
gem 'sidekiq', '~> 5.0', '>= 5.0.5'
gem 'sunspot_rails', '~> 2.2', '>= 2.2.7'
gem 'figaro', '~> 1.1', '>= 1.1.1'
gem 'kaminari', '~> 1.1', '>= 1.1.1'
gem 'devise', '~> 4.3'
gem 'active_model_serializers', '~> 0.10.6'
gem 'omniauth', '~> 1.7', '>= 1.7.1'
gem 'omniauth-google-oauth2', '~> 0.5.2'
gem 'omniauth-facebook', '~> 4.0'
gem 'omniauth-twitter', '~> 1.4'
gem 'faraday', '~> 0.9.2'
gem 'i18n', '~> 0.9.0'
gem 'carrierwave', '~> 1.2', '>= 1.2.1'
gem 'draper', '~> 3.0', '>= 3.0.1'
gem 'mini_magick', '~> 4.8'
gem 'redis', '~> 3.3', '>= 3.3.5'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', '~> 9.1',
    platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.15', '>= 2.15.4'
  gem 'selenium-webdriver', '~> 3.6'
  gem 'sunspot_solr', '~> 2.2', '>= 2.2.7'
  gem 'rspec', '~> 3.7'
end

group :development do
  gem 'rails-erd', '~> 1.5', '>= 1.5.2',
    require: false
  gem 'web-console', '~> 3.5', '>= 3.5.1'
  gem 'listen', '~> 3.1', '>= 3.1.5'
  gem 'spring', '~> 2.0', '>= 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'
  gem 'bullet', '~> 5.6', '>= 5.6.1'
end

gem 'tzinfo-data', '~> 1.2017', '>= 1.2017.3',
  platforms: [:mingw, :mswin, :x64_mingw, :jruby]