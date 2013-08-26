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

Install RVM, Ruby, and Rails

	\curl -L https://get.rvm.io | bash -s stable --autolibs=3 --rails

Use Ruby 2.0.0 (run this just in case you're running another version) 

	rvm use 2.0.0 --default

Check Ruby version to see that you're using 2.0.0-p247

	ruby -v
	
Check gem version (shows that gem is installed)

	gem -v

Check Rails version (shows that Rails is installed, should also be Rails 4.0)

	rails -v 
	
Run rvm configuration script

	source /home/jchan/.rvm/scripts/rvm

You may refer to [Installing Ruby, RVM, and Homebrew on Mac OSX][installosx] as well to install the things above.

Go to toolbelt.heroku.com, download the Heroku Toolbelt for Mac, and install it.

###Configuration

Git clone this project (scratch-cms) inside the directory of your choice.

	git clone git@github.com:jchan172/scratch-cms.git

Now check that everything for our project works. Go to the directory where the project is and then run:

	bundle install

We arrive at the tricky part: install PostgreSQL (9.2.4)

Open `~/.bash_profile` in a text editor

	gedit ~/.bash_profile

Add this to the end

	export PATH=/usr/local/bin:$PATH

	if [ -f ~/.bashrc ]; then
        source ~/.bashrc
	fi

Quit terminal and open it up again.

Update Homebrew

	brew update

Install PostgreSQL

	brew install postgresql

Ensure that you're using Homebrew's `psql`

	which psql
	# output should be '/usr/local/bin/psql' and not '/usr/bin/psql'

Start the psql server manually like it told you two steps ago after you installed postgresql

	pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start

Make it so that the server starts every time you boot your computer. First create a launch agent folder.
	
	mkdir -p ~/Library/LaunchAgents

Copy the .plist file from postgresql over to the folder you just created. Note that you'll need to check what version of `postgresql` you're using.

	cp /usr/local/Cellar/postgresql/9.2.4/homebrew.mxcl.postgresql.plist ~/Library/LaunchAgent

Then, have it load that .plist file every time you boot computer.

	launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

Make a postgres directory if it doesn't already exist

	sudo mkdir -p /usr/local/var/postgres

Tweak its permissions

	sudo chown yourusername:admin /usr/local/var/postgres/

Create a database

	initdb /usr/local/var/postgres/data

List the databases that exist

	psql -l

You should see something like this:

		                                    List of databases
	           Name           |  Owner   | Encoding | Collate | Ctype |   Access privileges   
	--------------------------+----------+----------+---------+-------+-----------------------
	 postgres                 | jchan    | UTF8     | C       | C     | 
	 template0                | jchan    | UTF8     | C       | C     | =c/postgres          +
	                          |          |          |         |       | postgres=CTc/postgres
	 template1                | jchan    | UTF8     | C       | C     | =c/postgres          +
	                          |          |          |         |       | postgres=CTc/postgres

This means that `psql` server is running and sees its databases. If you do `psql -l` and you see something like this:

	psql: could not connect to server: No such file or directory
	    Is the server running locally and accepting
	    connections on Unix domain socket "/var/pgsql_socket/.s.PGSQL.5432"?

It means that `psql` server is not running. People have had problems where `psql` is not started automatically on reboot. You might want to fix the problem (you're a hacker) for convenience purposes. Otherwise, you`ll have to  manually start the `psql` server every time you restart your computer and want to work on the project using this line: 

	pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start

After verifying that your pqsl is running, you'll need to go into the config/database.yml and change these lines. You can delete the password field.

	# inside config/database.yml:
	development:
	  adapter: postgresql
	  encoding: unicode
	  database: website_base_development (or whatever you want to name it)
	  pool: 5
	  username: <your shell username> 

Create the database.

	bundle exec rake db:create

Run a database migration.

	bundle exec rake db:migrate

Try to start a localhost server.

	rails s

If there are no errors, everything should work. Open up a web browser and navigate to http://localhost:3000/ You ought to see the website.

Now that you're done with the setup, take a look at Post-Setup.md for tips on customizing your front page and tips on pushing to Github and Heroku.

***Alternative PostgresQL Setup***

This is what worked for me after the `brew install postgresql` step, although I did a bunch of futzing around with installing PostgreSQL, so I don't know what could have changed during all that.

If you go into your Rails project directory now and try to run a server or do a `rake db:create`, you will get something along the lines of:

	FATAL:  role <your shell username> does not exist

Connect as postgres (--username=postgres) and create a superuser role (-s) where the role name is <your shell username>

	$ sudo su
	# su postgres
	# createuser -s --username=postgres <your shell username>

Go into the config/database.yml and change these lines. You can delete the password field.

	# inside config/database.yml:
	development:
	  adapter: postgresql
	  encoding: unicode
	  database: website_base_development (or whatever you want to name it)
	  pool: 5
	  username: <your shell username>

Now you can go into your project directory and create a database

	bundle exec rake db:create

Add a password to user you just created by getting into the psql shell

	sudo -u <shell username> pqsl website_base_development (or whatever you named the database it in previous step)

Now that you're in the psql shell, type

	\password

It will prompt you to enter a new password. Do so, and remember it! You'll need to know this later in Post Setup. Enter it again to confirm.

Now you can quit out of the psql shell by typing 

	\q

Useful Information
==================

###Git Settings
Github is where you will store your project, so you won't lose all the hard work you've gone through. To push to Github without entering username and password every time, make sure to configure the remote this way:

	git remote set-url origin <insert your github project URL, something like git@github.com:jchan172/scratch-cms.git>

You have to upload your SSH key to Github. If you don't have an SSH key, run the line below. You should probably check out the link down in the "Reference" section about generating SSH keys. That might be a better guide.

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

Reference
=========
[Generating SSH Keys][sshkeys]

[Markdown Syntax][markdown]

[Installing Ruby, RVM, and Homebrew on Mac OSX][installosx]

[sshkeys]: https://help.github.com/articles/generating-ssh-keys
[markdown]: http://daringfireball.net/projects/markdown/syntax
[installosx]: http://www.interworks.com/blogs/ckaukis/2013/03/05/installing-ruby-200-rvm-and-homebrew-mac-os-x-108-mountain-lion