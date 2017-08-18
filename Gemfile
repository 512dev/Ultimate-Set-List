source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.3.3'
# # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# gem 'rails'
# # gem 'rails', '~> 5.0.4'
# # Use postgresql as the database for Active Record
# gem 'pg'
# # gem 'pg', '~> 0.18'
# # Use Puma as the app server
# gem 'puma'
# # gem 'puma', '~> 3.0'
# # Use SCSS for stylesheets
# gem 'sass-rails'
# # gem 'sass-rails', '~> 5.0'
# # Use Uglifier as compressor for JavaScript assets
# gem 'uglifier'
# # gem 'uglifier', '>= 1.3.0'
# # Use CoffeeScript for .coffee assets and views
# gem 'coffee-rails'
# # gem 'coffee-rails', '~> 4.2'
# # See https://github.com/rails/execjs#readme for more supported runtimes
# # gem 'therubyracer', platforms: :ruby

# # Use jquery as the JavaScript library
# gem 'jquery-rails'
# # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks'
# # gem 'turbolinks', '~> 5'
# # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder'
# # gem 'jbuilder', '~> 2.5'
# # Use Redis adapter to run Action Cable in production
# # gem 'redis', '~> 3.0'
# # Use ActiveModel has_secure_password
# # gem 'bcrypt', '~> 3.1.7'
# gem 'devise'
# gem 'figaro'
# gem 'bootstrap-sass'
# gem 'font-awesome-sass'
# gem 'simple_form'
# gem 'autoprefixer-rails'
gem 'devise'
gem 'figaro'
gem 'jbuilder', '~> 2.0'
gem 'pg'
gem 'puma'
gem 'rails', '5.1.3'
gem 'redis'
gem 'turbolinks'  #from rails, not LeWagon

gem 'autoprefixer-rails'
gem 'coffee-rails'
gem 'bootstrap-sass'
gem 'font-awesome-sass'
gem 'jquery-rails'
gem 'sass-rails'
gem 'simple_form'
gem 'uglifier'
gem 'rspotify'#, git: 'https://github.com/guilhermesad/rspotify.git'
gem 'pundit'



group :development, :test do
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
