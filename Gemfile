source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'jquery-rails', '2.0.2' # incorporate jquery
gem 'bootstrap-sass', '2.1' # Twitter Bootstrap for frontend
gem 'bcrypt-ruby', '3.0.1' # gem for password authentication (enables us to use ActiveModel has_secure_password method)
gem 'pg' # use PostgreSQL for development and production
gem 'unicorn' # allows using multiple processes on one Heroku dyno
gem 'localtunnel' # expose your localhost server to the public web
gem 'annotate' # adds comments to model showing the schema of the model
gem 'better_errors' # better interface for showing errors
gem 'font-awesome-rails' # icon font (such as briefcase pic instead of writing out "briefcase")
gem 'hirb' # makes console output nicer to read
gem 'meta_request' # shows information about app requests in browser (remember also need chrome extension)
gem 'railroady' # generates UML diagrams
gem 'truncate_html' # used to give a preview of content (cuts off content after n characters)
gem 'redactor-rails' # wysiwyg html 
gem 'will_paginate' # allows pagination, showing a limited number of things at once per page
gem 'bootstrap-will_paginate' # allows use of bootstrap's pagination styles
gem 'carrierwave' # something that redactor needs for uploading files (hold off on implementing this functionality)
gem 'mini_magick' # also something that redactor needs for uploading files (hold off on implementing this functionality)
# gem 'smusher' # lossless reduction of images

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
