Dev Environment Setup For Mac
=============================

###Installation

Install XCode (won't be using XCode, but need its libraries)

Install Homebrew, a tool that makes it easy to install other stuff via command line

	ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
	brew doctor # check if there are any problems; warnings are ok

Create a Github account if you don't already have an account.

Go to git-scm.com/downloads, then download and install git.

Create a Heroku account if you don't already have an account.

Install RVM and Ruby

	\curl -L https://get.rvm.io | bash -s stable --ruby

Use Ruby 2.0.0 (run this just in case you're running another version) 

	rvm use 2.0.0 --default

Check Ruby version to see that you're using 2.0.0-p247

	ruby -v
	
Check gem version (shows that gem is installed)

	gem -v

You may refer to [Installing Ruby, RVM, and Homebrew on Mac OSX][installosx] as well to install the things above.
	
Install Rails

	\curl -L https://get.rvm.io | bash -s stable --autolibs=3 --rails
	
Check Rails version (shows that Rails is installed)

	rails -v 
	
Run rvm configuration script

	source /home/jchan/.rvm/scripts/rvm

Go to toolbelt.heroku.com, download the Heroku Toolbelt for Mac, and install it.

###Configuration

Git clone this project (scratch-cms) inside the directory of your choice.

	git clone git@github.com:jchan172/scratch-cms.git

Now check that everything for our project works. Go to the directory where the project is and then run:

	bundle install

We arrive at the tricky part: install PostgreSQL (9.2.4)

Update Homebrew

	brew update

Install PostgreSQL

	brew install postgresql

Make a postgres directory if it doesn't already exist

	sudo mkdir -p /usr/local/var/postgres

Tweak its permissions

	sudo chown yourusername:admin /usr/local/var/postgres/

Create a database

	initdb /usr/local/var/postgres/data

If you go into your Rails project directory now and try to run a server or do a `rake db:create`, you will get something along the lines of:

	FATAL:  role <your shell username> does not exist

Connect as postgres (--username=postgres) and create a superuser role (-s) where the role name is <your shell username>

	$ sudo su
	# su postgres
	# createuser -s --username=postgres <your shell username>

Now you can go into your project directory and create a database

	rake db:create

If it completes without complaining, you should be able to start the server with this:

	rails s

If there are no errors, everything should work. Open up a web browser and navigate to http://localhost:3000/ You ought to see the website.

Now that you're done with the setup, take a look at Post-Setup.md for tips on customizing your front page and tips on pushing to Github and Heroku.

Useful Information
==================

###Git Settings
To push to Github without entering username and password every time, make sure to configure the remote this way:

	git remote set-url origin git@github.com:jchan172/scratch-cms.git

You have to upload your SSH key to Github. If you don't have an SSH key, run this line:

	ssh-keygen-t rsa -C "your_email@example.com"

Then enter a passphrase (don't need to use passphrase, so press enter and then enter again)

Your SSH keys are now in ~/.ssh/

Login to Github, click on your username, click on "Edit your profile", and then click on "SSH Keys" on the left.

Click on the "Add SSH key" and paste the contents from ~/.ssh/id_rsa.pub

Test to see if this works by running this:

	ssh -vT git@github.com

Remember to set name and email so that it shows up in commits

	git config --global user.name "Your Name"
	git config --global user.email your@email.com

Set your master branch to track origin master

	# ensure you're on the local master branch
	git checkout master

	# if you're using git version 1.7
	git branch --set-upstream master origin/master

	# if you're using git version 1.8
	git branch -u origin/master

### Deploying to Heroku
First you must login to Heroku.

	heroku login

If you don't have a Heroku app already, you'll need to create an app.

	heroku create

If you have an existing Heroku app, just add the remote.

	heroku git:remote -a scratch-cms

The previous line didn't work for me, but this did:

	git remote add heroku git@heroku.com:scratch-cms.git

To push code up to Heroku, simply do this:

	git push heroku master

Once the code is pushed without errors, remember to have Heroku migrate the database.

	heroku run rake db:migrate

Now, you can look at your project on Heroku by doing this:

	heroku open

You can check how the app is running on Heroku using this (shows if app is up or down and for how long):

	heroku ps

If you want to check the Heroku logs in real time, use this command:

	heroku logs -t

To restart the app on Heroku, do this:

	heroku restart

Reference
=========
[Generating SSH Keys][sshkeys]

[Markdown Syntax][markdown]

[Installing Ruby, RVM, and Homebrew on Mac OSX][installosx]

[sshkeys]: https://help.github.com/articles/generating-ssh-keys
[markdown]: http://daringfireball.net/projects/markdown/syntax
[installosx]: http://www.interworks.com/blogs/ckaukis/2013/03/05/installing-ruby-200-rvm-and-homebrew-mac-os-x-108-mountain-lion