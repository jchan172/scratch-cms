Post-Setup Tips
===============

###Customizing the Home Page
The only thing you really need to do now is customize the home page to the way you want. It's front-end UI work, so you'll only be working with HTML, CSS, and JavaScript. You can use any text editor/IDE to do your editing, but we recommended Sublime Text. It's so good that we go out of our way to promote it with these two sentences.

After visualizing what you want on your home page, you can go and find stuff on the internet to plug in. If you're a real badass, you can make your own stuff. For example, if you wanted a sliding carousel on your website, you could find some package online that's fairly easy to integrate. It'll usually have some .js and .css files you'll need to include, as well as the HTML code to properly display the thing. Any .js or .css files you need can be included by putting the files into app/assets/. The .js files will go into javascripts/, and .css files will go into stylesheets/. Rails will import those automatically; it's how the Rails asset pipeline works. 

You'll probably want to change some CSS code to style it the home page the way you want. Look for the stylesheets in app/assets/stylesheets/. Most of the custom CSS code is in custom.css.scss, so you can edit/add to that one to get the styles you want. To be more organized, you can even (probably should) create a new.css file. In addition to the CSS styles, you can add/edit HTML for the home page inside the app/views/pages/home.html.erb file. To customize the navbar, look at app/views/layouts/_header.html.erb. You'll see some embedded Ruby code, so you can modify and add to the navbar with that code as an example. The footer is located at app/views/layouts/_footer.html.erb, so change that to your liking. We ask that you please keep the "Built from Scratch CMS" logo there though.

###Pushing to Git
As you make changes, you'll want to push to your own repository inside Github. There are instructions on how to create your own repository and using Git all over the internet, and especially on [www.github.com][www.github.com]

###Deploying to Heroku
Heroku is where you'll host your website so that everyone in the world can access it. Deploying is easy with the Heroku toolbelt installed. Find instructions on [www.heroku.com][www.heroku.com] for how to deploy your app to Heroku. You should deploy to Heroku often so that you know when you added code that makes the website not work.