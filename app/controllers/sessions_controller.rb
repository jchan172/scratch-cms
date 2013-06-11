class SessionsController < ApplicationController
	def new # http GET request
		# nothing needs to be done
		# rails will simply bring up the new.html.erb view
	end

	def create # http POST request
		# once login button is pushed, it sends a POST request, which brings us here.
		# we have access to the username and password that the user entered
		# by getting params[:session][:username] and params[:session][:password]

		# first look in the database for the user
		user = Users.find_by_username(params[:session][:username])
		# if there's a user and we can authenticate with password
		if user && user.authenticate(params[:session][:password])
			sign_in user # call a helper method to sign in the user (need to add method ourselves)
			redirect_to '/dashboard' # bring the user to his page (uses standard rails method)
		else # otherwise, a user doesn't exist or the password wasn't right
			flash.now[:error] = "Username/password combination is not correct"
			# rerender the login page. the flash.now call will set a banner to display
			render 'new'
		end
	end

	def destroy # http DELETE request
		sign_out # calls a helper method to sign out the user (need to add method ourselves)
		redirect_to root_url # redirect to home page (uses standard rails method)
	end
	
end
