source 'https://rubygems.org'

ruby '2.0.0'
gem 'rails', '~> 4.2.1'
gem 'jquery-rails', '3.0.4' # incorporate jquery
gem 'bootstrap-sass', '2.3.0.1' # Twitter Bootstrap for frontend
gem 'sass-rails', '~> 4.0.3' # integration for sass (frontend stylesheet stuff)
gem 'coffee-rails' # compiles coffeescript
gem 'uglifier' # used for minifying javascript
gem 'turbolinks' # turbolinks makes apps appear faster by replacing HTML instead of full reload
gem 'bcrypt-ruby', '3.0.1' # gem for password authentication (enables us to use ActiveModel has_secure_password method)
gem 'pg' # use PostgreSQL for development and production
gem 'unicorn' # allows using multiple processes on one Heroku dyno
gem 'font-awesome-rails' # icon font (such as briefcase pic instead of writing out "briefcase")
gem 'truncate_html' # used to give a preview of content (cuts off content after n characters)
# gem 'redactor-rails', '0.4' # wysiwyg html 
gem 'will_paginate' # allows pagination, showing a limited number of things at once per page
gem 'bootstrap-will_paginate' # allows use of bootstrap's pagination styles
gem 'jbuilder' # gives simple language for declaring JSON structures
# gem 'carrierwave' # something that redactor needs for uploading files (hold off on implementing this functionality)
# gem 'mini_magick' # also something that redactor needs for uploading files (hold off on implementing this functionality)
# gem 'smusher' # lossless reduction of images
gem 'newrelic_rpm' # Heroku add-on for analytics
gem 'rename' # allows you to rename the Rails project. simply run 'rails g rename:app_to <insert new name>'
gem 'friendly_id', '~> 5.1.0' # allows routing to human friendly URLs instead of number IDs

# these gems used both in development and testing
group :development, :test do
  gem 'web-console', '~> 2.0' # allows a console to be put in views using <%= console %>
	# gem 'sqlite3', '1.3.5' # use sqlite for our development database
	gem 'rspec-rails', '2.11.0' # use rspec as our testing platform
	gem 'better_errors' # better interface for showing errors
	gem 'annotate' # adds comments to model showing the schema of the model
	gem 'hirb' # makes console output nicer to read
	gem 'localtunnel' # expose your localhost server to the public web
	gem 'meta_request' # shows information about app requests in browser (remember also need chrome extension)
	gem 'railroady' # generates UML diagrams
end

# i don't always test my code, but when i do, i do it in production
group :test do
	gem 'cucumber-rails', '1.3.0', :require => false # more testing tools
	gem 'database_cleaner', github: 'bmabey/database_cleaner' # not required but highly recommended by makers of cucumber
	gem 'capybara' # allows us to easily navigate to a page, click links, fill out forms, submit forms, and check the contents of web pages for items during testing
	gem 'factory_girl_rails' # easy way to create user during testing
end

# Gems only used for production.
group :production do
  gem 'rails_12factor', '0.0.2'             # Used by Heroku to serve static assets such as images and stylesheets.
  # if using Amazon RDS, uncoomment the two lines below and set up Amazon RDS add-on (look at Heroku documentation)
  # gem 'mysql2'                            # MySQL connector
  # gem 'mysql', '2.9.1'                      # Our production database is mysql on Amazon RDS.
end

# Gems only used for documentation
group :doc do
  gem 'sdoc', '0.3.20', require: false
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
