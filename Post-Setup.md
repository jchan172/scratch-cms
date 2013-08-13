Post-Setup Tips
===============

###Customizing the Home Page
The only thing you really need to do now is customize the home page to the way you want. It's front-end UI work, so you'll only be working with HTML, CSS, and maybe JavaScript. You can use any text editor/IDE to do your editing, but we recommended Sublime Text. It's so good that we go out of our way to promote it with these two sentences.

After visualizing what you want on your home page, you can go and find stuff on the internet to plug in. If you're a real badass, you can make your own stuff. For example, if you wanted a sliding carousel on your website, you could find some package online that's fairly easy to integrate. It'll usually have some .js and .css files you'll need to include, as well as the HTML code to properly display the thing. Any .js or .css files you need can be included by putting the files into app/assets/. The .js files will go into javascripts/, and .css files will go into stylesheets/. Rails will import those automatically; it's how the Rails asset pipeline works.

You'll probably want to change some CSS code to style it the home page the way you want. Look for the stylesheets in app/assets/stylesheets/. Most of the custom CSS code is in custom.css.scss, so you can edit/add to that one to get the styles you want. To be more organized, you can even (probably should) create a new .css file(s). In addition to the CSS styles, you can add/edit HTML for the home page inside the app/views/pages/home.html.erb file. Note that any image you want to display work properly with plain HTML <img> tags. You'll have to go Rails style and use <%= image_tag ... %>. See an example of this in home.html.erb (ScratchCMS.png is inside an <%= image_tag %>). To customize the navbar, look at app/views/layouts/_header.html.erb. You'll see some embedded Ruby code, so you can modify and add to the navbar with that code as an example. The footer is located at app/views/layouts/_footer.html.erb, so change that to your liking. We ask that you please keep the "Built from Scratch CMS" logo there though.

###Pushing to Git
As you make changes, you'll want to push to your own repository inside Github. There are instructions on how to create your own repository and using Git all over the internet, and especially on [www.github.com][github]

###Deploying to Heroku
Heroku is where you'll host your website so that everyone in the world can access it. Deploying is easy with the Heroku toolbelt installed. Find instructions on [www.heroku.com][heroku] for how to deploy your app to Heroku. You should deploy to Heroku often so that you know when you added code that makes the website not work. There is a one time thing you have to do to set up Heroku. After this, deployment to Heroku is really easy.

Create a new app in Heroku's dashboard. Remember the name of the app.

Add the remote so you can push to Heroku.

	heroku git:remote -a <your app name, e.g. falling-wind-1624>

Add what you have right now to Git.

	git add .

Commit everything.

	git commit -m "About to push to Heroku"

Switch to Ruby 1.9.3 (2.0.0 might have issues with the following steps)

	rvm use 1.9.3

Install the 'taps' gem

	gem install taps

Push local database schema to Heroku

	heroku db:push postgres://<your username>:<your password>@localhost/<your db name>

Confirm by typing your app name again.

There are probably going to be problems, but the important thing is that schema and redactor assets are pushed up to Heroku.

Change back to Ruby 2.0

	rvm use 2.0.0

Compile assets locally.

	bundle exec rake assets:precompile

Add the assets and ensure that .gitignore file doesn't contain a line that says "public/assets or public/assets/*"

	git add public/assets/

Commit this change.

	git commit -m "Added precompiled assets"

Push to Heroku.

	git push heroku master

Run a database migration on Heroku

	heroku run rake db:migrate

If it completes, then you're set up to deploy on Heroku. After this, all you have to do is develop, compile assets, and push to Heroku. These are the steps:

	(edit, change, write code)
	git add .
	git commit -m "Enter your commit message here"
	git push origin master
	git push heroku master

Note that there is a "problem" with deploying to Heroku regarding asset compilation. Ideally, when you push to Heroku, it will do asset precompilation for you. But currently, that is failing with Scratch CMS. Something needs user environment variables, which prevents Heroku from doing the compilation. Therefore, you have to do asset compilation on your local machine before pushing up to Heroku (read ["Rails Asset Pipeline on Heroku Cedar"][assetpipeline] for more information). It's actually suggested as the preferred method (Heroku says it attempts to do asset compilation if you don't do it locally). If you don't want to compile assets locally and push, you can use Heroku's user-env-compile add-on (see [user-env-compile documentation][user-env-compile]). Basically, this tells Heroku to use user environment variables to compile assets. Once you set up your app and know its name, enable the add-on as shown in [user-env-compile documentation][user-env-compile]. It's a one time thing. You then ought to be able to push to Heroku without problems. Note that this is an experimental thing by Heroku, and they may cancel it.

[github]: http://www.github.com
[heroku]: http://www.heroku.com
[assetpipeline]: https://devcenter.heroku.com/articles/rails-asset-pipeline
[user-env-compile]: https://devcenter.heroku.com/articles/labs-user-env-compile
