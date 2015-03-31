source 'https://rubygems.org'


gem 'rails', '~> 4.2.0'
gem 'rails-api'
gem 'pg'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'
gem 'nbrb-api', git: 'https://github.com/pluff/nbrb-api.git'

gem 'active_model_serializers', git: 'https://github.com/rails-api/active_model_serializers.git'

group :test, :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem "spring-commands-rspec"
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'pry'
end

group :test do
  gem 'shoulda-matchers', require: false
  gem 'database_cleaner'
end

group :development do
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-rvm'
end

group :production do
  gem 'unicorn'
end
