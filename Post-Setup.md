Post-Setup
==========

###Pushing to Git
As you make changes, you'll want to push to your own repository inside Github. There are instructions all over the internet on how to create your own repository and using Git, and especially on [the git website][git].

###Deploying to Heroku
Heroku is where you'll host your website so that everyone in the world can access it. Deploying is easy with the Heroku toolbelt installed. Find instructions on [Heroku's getting started guide][heroku] for how to deploy your app to Heroku. You should deploy to Heroku often so that you know when you added code that makes the website not work. There is a one time thing you have to do to set up Heroku. After this, deployment to Heroku is really easy.

Create a new app in Heroku's dashboard. Remember the name of the app.

Now log in using the command line.

	heroku login

Add the remote so you can push to Heroku.

	heroku git:remote -a <your app name, e.g. falling-wind-1624>

Add and commit changes.

	git add .
	git commit -m "Initial commit"

Push to Heroku.

	git push heroku master

You should see that Ruby gems install and asset precompilation succeeds. If the steps above complete successfully, then you've deployed your web site! After this, all you have to do is develop and push to Heroku until you're happy with your website. These are the steps when developing:

	# (edit, change, write code)
	git add .
	git commit -m "Enter your commit message here"
	git push origin master
	git push heroku master

###Customizing the Home Page
The only thing you really need to do now is customize the home page to the way you want. It's front-end UI work, so you'll only be working with HTML, CSS, and maybe JavaScript. You can use any text editor/IDE to do your editing, but we recommended Sublime Text. It's so good that we go out of our way to promote it with these two sentences.

After visualizing what you want on your home page, you can go and find stuff on the internet to plug in. For example, if you wanted a sliding carousel on your website, you could find some package online that's fairly easy to integrate. It'll usually have some .js and .css files you'll need to include, as well as the HTML code to properly display the thing. Any .js or .css files you need can be included by putting the files into app/assets/. The .js files will go into javascripts/, and .css files will go into stylesheets/. Rails will import those automatically; it's how the Rails asset pipeline works. If you're a real badass, you can make your own stuff.

You'll probably want to change some CSS code to style it the home page the way you want. Look for the stylesheets in app/assets/stylesheets/. Most of the custom CSS code is in custom.css.scss, so you can edit/add to that file to get the styles you want. To be more organized, you can even (probably should) create new .css files. In addition to the CSS styles, you can add/edit HTML for the home page inside the app/views/pages/home.html.erb file. Note that any image you want to display work properly with plain HTML <img> tags. You'll have to go Rails style and use <%= image_tag ... %>. See an example of this in home.html.erb (ScratchCMS.png is inside an <%= image_tag %>). To customize the navbar, look at app/views/layouts/_header.html.erb. You'll see some embedded Ruby code, so you can modify and add to the navbar with that code as an example. The footer is located at app/views/layouts/_footer.html.erb, so change that to your liking. We ask that you please keep the "Built from Scratch CMS" logo there though.

###Heroku Reference
If you're confused, find some information online about how Heroku works. There are plenty of other tutorials on the web that show you how to set it up so that you can push your project to it. Anyway, below are some basic and very useful commands.

This is how you login.

	heroku login

This is how you add a Heroku remote.

	git remote add heroku git@heroku.com:name-of-the-app.git

To push code up to Heroku, simply do this:

	git push heroku master

If you change the models or schema at all, remember to migrate the database when you deploy to Heroku.

	heroku run rake db:migrate

You can look at your project on Heroku by doing this:

	heroku open

You can check how the app is running on Heroku using this (shows if app is up or down and for how long):

	heroku ps

If you want to check the Heroku logs in real time, use this command:

	heroku logs -t

To restart the app on Heroku, do this:

	heroku restart

You can backup your Heroku database. This is how to install Heroku pg:transfer plugin ([documentation][pgtransfer] here if you need).

	heroku plugins:install https://github.com/ddollar/heroku-pg-transfer

Push local database to Heroku:

	heroku config
	# Now write down the HEROKU_POSTGRESQL_X_URL shown from previous command
	heroku pg:transfer --from postgres://<your username>:<your password>@localhost/<your db name> --to <HEROKU_POSTGRESQL_X_URL you just wrote down> 
	# Confirm by typing your app name again.

Pull database from Heroku:

	heroku config
	# Now write down the HEROKU_POSTGRESQL_X_URL shown from previous command
	heroku pg:transfer --from <HEROKU_POSTGRESQL_X_URL you just wrote down> --to  postgres://<your username>:<your password>@localhost/<your db name>
	# Confirm by typing your app name again.

[git]: http://git-scm.com/documentation
[heroku]: https://devcenter.heroku.com/articles/quickstart
[pgtransfer]: http://www.higherorderheroku.com/articles/pgtransfer-is-the-new-taps/