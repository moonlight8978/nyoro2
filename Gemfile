source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails',                    '5.1.4'
gem 'mysql2',                   '0.4.10'
gem 'puma',                     '3.11.0'
gem 'sass-rails'
gem 'autoprefixer-rails'
gem 'uglifier'
gem 'turbolinks',               '5.0.1'
gem 'bcrypt',                   '3.1.11'
gem 'groupdate',                '3.2.0'
gem 'sidekiq',                  '5.0.5'
gem 'sunspot_rails',            '2.2.7'
gem 'figaro',                   '1.1.1'
gem 'kaminari',                 '1.1.1'
gem 'active_model_serializers', '0.10.7'
gem 'faraday',                  '0.9.2'
gem 'i18n',                     '0.9.0'
gem 'redis',                    '3.3.5'

## Authenticate + Authorization + Social login
gem 'devise',                 '4.3.0'
gem 'cancancan',              '2.1.2'
gem 'omniauth',               '1.7.1'
gem 'omniauth-google-oauth2', '0.5.2'
gem 'omniauth-facebook',      '4.0.0'
gem 'omniauth-twitter',       '1.4.0'

## Decorator
gem 'draper', '3.0.1'

## Image uploader
gem 'carrierwave', '1.2.1'
gem 'mini_magick', '4.8.0'

## Template engine
gem 'slim',       '3.0.9'
gem 'slim-rails', '3.1.3'

group :development, :test do
  gem 'byebug',                   '9.1',
    platforms: [:mri, :mingw, :x64_mingw]

  gem 'capybara',                 '2.16.1'
  gem 'selenium-webdriver',       '3.8.0'

  gem 'rspec',                    '3.7'
  gem 'rspec-rails',              '3.7.2'
  gem 'rails-controller-testing', '1.0.2'

  gem 'factory_bot',              '4.8.2'
  gem 'factory_bot_rails',        '4.8.2'

  gem 'database_cleaner',         '1.6.2'

  gem 'sunspot_solr',             '2.2.7'
end

group :development do
  gem 'rails-erd',             '1.5.2',
    require: false
  gem 'web-console',           '3.5.1'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
  gem 'bullet',                '5.7.0'
end
