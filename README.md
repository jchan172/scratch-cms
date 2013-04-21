Project Overview
====================

This project is the foundation for Jack and Andy's personal websites. The website will have a very basic content management system (CMS) that allows for easy content publishing. The CMS will require a login system (although we only need to have one user in the end). Once this is implemented, Jack and Andy can take this project and customize front-end or whatever else for their own personal websites.

Dev Environment Setup
====================

# If not running on native Ubuntu, first install a VirtualBox, create a new virtual machine, and  then install Ubuntu 12.10. 
# To have a responsive VirtualBox system, give Ubuntu 1024 MB (or more) of RAM, enable 3D acceleration, and install VirtualBox's Guest Additions.

Once Ubuntu is set up, here are a few things that you'll need to do in order for Rails to work as we want.

Open terminal, go to edit -> profile preferences -> Title and Command tab -> check the "Run command as a login shell" box.

	# installs bunch of packages that are needed later
	sudo apt-get install zlib1g-dev curl sqlite3 libsqlite3-dev nodejs openssl 
	
	# install rvm with ruby
	\curl -L https://get.rvm.io | bash -s stable --ruby 
	
	source /home/jchan/.rvm/scripts/rvm
may need to remove ruby 1.9.3 and reinstall b/c of openssl. if so, run the two lines below:

	# remove ruby 1.9.3
	rvm remove 1.9.3

	# install & compile w/ openssl
	rvm install 1.9.3 --with-openssl-dir=$HOME/.rvm/usr
	rvm use 1.9.3 --default # use 1.9.3 as default, in case already using another ver.
	ruby -v # check ruby version
	gem -v # check gem version
	\curl -L https://get.rvm.io | bash -s stable --rails # install rails
	rails -v # check rails version
source /home/jchan/.rvm/scripts/rvm # run rvm configuration script
now install heroku toolbelt:
	wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh 
Request access from the heroku admin (Jack) to collaborate on the app "fnet-app-topo" in order to access it with git using the below instructions. 

clone the project repo from the aep git repository referenced via this link
http://fww.tc.fluke.com/~fnetwiki/twiki/bin/view/AdvEngProgram/AEPGIT
and then add associate it with heroku using the below instructions.

first, cd into the project directory, and then 
	git remote add heroku git@heroku.com:fnet-app-topo.git
	git remote -v will now show that the heroku git repo is a remote with
	heroku login # to log into heroku, and then you ought to be able to push
	git push heroku master

Post Setup
# Check that rails has no problems by making it create a new rails app:
rails new abcdefg
# This should create a folder abcdefg with bunch of files inside. If this ran s
# sucessfully, rails has no problems. You can now use rm -r to delete that folder.
# Now check that everything for our project works. Go to the directory where the # project is and then run:
bundle install --without production 
# This installs project's dependencies without the postrgesql package that's used only on heroku's end (causes local problems)
rails s # starts a localhost server
# If there are no errors, everything should work.
# Open up a web browser and navigate to http://localhost:3000/
# You ought to see the website.