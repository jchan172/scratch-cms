Project Overview
====================

This project is the foundation for our personal websites. The website will have a very basic content management system (CMS) that allows for easy content publishing so that we don't have to bust out terminals and text editors every time we want to post some content to our websites. 

The CMS will require a login system (although we only need to have one user in the end). Once this is implemented, we can take this project and customize front-end or whatever else for our own personal websites.

Dev Environment Setup
====================

###Installation
If not running on native Ubuntu, first install a VirtualBox, create a new virtual machine, and  then install Ubuntu 12.10. 

To have a responsive VirtualBox system, give Ubuntu 1024 MB (or more) of RAM, enable 3D acceleration, and install VirtualBox's Guest Additions.

Once Ubuntu is set up, here are a few things that you'll need to do in order for Rails to work as we want.

Open a terminal, go to edit -> profile preferences -> Title and Command tab -> check the "Run command as a login shell" box.

	# installs bunch of packages that are needed later
	sudo apt-get install zlib1g-dev curl sqlite3 libsqlite3-dev nodejs openssl postgresql postgresql-client libpq-dev libreadline6-dev libyaml-dev libxml2-dev libxslt1-dev autoconf libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
	
	# install RVM with Ruby
	\curl -#L https://get.rvm.io | bash -s stable --autolibs=3 --ruby
	
	# runs script to configure Ruby
	source /home/jchan/.rvm/scripts/rvm

May need to remove ruby 2.0.0 and reinstall b/c of openssl. if so, run the two lines below:

	# remove ruby 2.0.0
	rvm remove 2.0.0

	# install & compile w/ openssl
	rvm install 2.0.0 --with-openssl-dir=$HOME/.rvm/usr
	
Use Ruby 2.0.0 (run this just in case you're running another version) 

	rvm use 2.0.0 --default

Check Ruby version to see that you're using 2.0.0

	ruby -v
	
Check gem version (shows that gem is installed)

	gem -v
	
Install Rails

	\curl -L https://get.rvm.io | bash -s stable --autolibs=3 --rails
	
Check Rails version (shows that Rails is installed)

	rails -v 
	
Run rvm configuration script

	source /home/jchan/.rvm/scripts/rvm

Now install heroku toolbelt:

	wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh 

###Configuration

Git clone our project.

Now check that everything for our project works. Go to the directory where the project is and then run:

	bundle install

Set up PostgreSQL

	sudo -u postgres createuser <your shell username>
	# Shall the NEW ROLE be a superuser? (y/n) n
	# Shall the NEW ROLE be allowed TO CREATE DATABASES? (y/n) y
	# Shall the NEW ROLE be allowed TO CREATE more NEW roles? (y/n) n

Go into the config/database.yml and change these lines. You can delete the password field.

	# inside config/database.yml:
	development:
	  adapter: postgresql
	  encoding: unicode
	  database: website_base_development
	  pool: 5
	  username: <your shell username>

Go to the top of the project directory and create a database:

	rake db:create

Try to start a localhost server

	rails s

If there are no errors, everything should work.
Open up a web browser and navigate to http://localhost:3000/
You ought to see the website.

###Git Settings
To push to Github without entering username and password every time, make sure to configure the remote this way:

	git remote set-url origin git@github.com:jchan172/website_base.git

You have to upload your SSH key to Github. If you don't have an SSH key, run this line:

	ssh-keygen-t rsa -C "your_email@example.com"

Then enter a passphrase (don't need to use passphrase, so press enter and then enter again)

Your SSH keys are now in ~/.ssh/

Login to Github, click on your username, click on "Edit your profile", and then click on "SSH Keys" on the left.

Click on the "Add SSH key" and paste the contents from ~/.ssh/id_rsa.pub

Test to see if this works by running this:

	ssh -T git@github.com

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

###Git Tools
git-cola and git-gui are nice all-in-one tools.

	sudo apt-get install git-cola git-gui

To start git-cola, run 'git-cola' in terminal. To start git-gui, run 'git gui' in terminal.

gitg is nice for examining history.

	sudo apt-get install gitg

To start gitg, run 'gitg' in terminal.


Reference
====================
[Setting up PostgreSQL with Rails on Linux][postgres]

[Generating SSH Keys][sshkeys]

[Markdown Syntax][markdown]

[postgres]: http://mrfrosti.com/2011/06/setup-postgresql-with-rails-on-linux/
[sshkeys]: https://help.github.com/articles/generating-ssh-keys
[markdown]: http://daringfireball.net/projects/markdown/syntax