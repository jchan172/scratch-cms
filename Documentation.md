Documentation
====================

Create a new project and use PostrgeSQL as the database. Note that some other configuration with PostrgeSQL will be required in order to run properly.

	# create a new project using postrgesql as database
	rails new website_base -d postgresql

Generate controller with some views. These are the general website pages, such as the home page.

	# generate a pages controller w/ home, about, standard, and blog pages
	rails generate controller Pages home about standard blog 

Generate a controller for user login. The controller will pass information to model to process. It brings up the appropriate views, such as a page with username and password text boxes. 'new' is going to be the page to display for creating a new account, although we will only have to do it once. 'edit' is going to be the page for editing the user's password and other profile stuff. 'show' is the test page.
	
	# generate a controller with 'new' and 'show' pages
	rails generate controller Users new edit show

This creates a model where a user will have a name and data attached to it, where both are strings. Password will be added later in the code because it is more complicated and will require more work (not something we should have Rails generate).

	# generate a user model
	rails generate model User name:string email:string

We added a model, so this will change the database even though there is no data yet. So, we need to update the database.

	# update database
	bundle exec rake db:migrate

I added code inside the model (user.rb) that checks name and email to ensure they are not too long, are unique, etc. Even though the model should enforce uniqueness, we should have the database do it as well for extra security. We should give indices to emails and then have the database ensure that those indices are unique upon creation of a new user. To change the database, a thig called a migration is necessary. Note that before when we changed the database when generating the model, Rails changed the database in that 'generate' call.

We generate a migration naming it something descriptive, go inside that migration file (under db/migrate/) to specify what we want to do, and then we have to update the database.

	# generate a migration
	rails generate migration add_index_to_users_email
	# now go inside the file and do stuff

Update the database now that it's changed.

	# update database
	bundle exec rake db:migrate