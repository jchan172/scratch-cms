source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'jquery-rails', '2.0.2' # incorporate jquery
gem 'bootstrap-sass', '2.1' # twitter bootstrap for frontend
gem 'bcrypt-ruby', '3.0.1' # gem for password authentication (enables us to use ActiveModel has_secure_password method)
gem 'pg' # use postgresql for development and production

# these gems used both in development and testing
group :development, :test do
	# gem 'sqlite3', '1.3.5' # use sqlite for our development database
	gem 'rspec-rails', '2.11.0' # use rspec as our testing platform
end

# these gems only used for testing
group :test do
	gem 'cucumber-rails' # more testing tools
	gem 'database_cleaner' # not required but highly recommended by makers of cucumber
	gem 'capybara', '1.1.2' # allows us to easily navigate to a page, click links, fill out forms, submit forms, and check the contents of web pages for items during testing
	gem 'factory_girl_rails', '4.1.0' # easy way to create user during testing
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.5' # integration for sass (frontend stylesheet stuff)
  gem 'coffee-rails', '3.2.2' # compiles coffeescript
  gem 'uglifier', '1.2.3' # used for minifying javascript
end

# # use these gems on heroku
# group :production do
#   gem 'pg', '0.12.2' # postgresql gem
# end




# Comments provided by default:

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
