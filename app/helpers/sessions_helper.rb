module SessionsHelper
	def sign_in(user)
		# takes the user's authentication token and stores it inside a cookie, which resides on the browser
		cookies.permanent[:auth_token] = user.auth_token
		# sets the current user to user. we want to keep track of the current user
		# so that we can decide to show different options.
		@current_user = user
	end

	# this method is for use by signed_in? method
	def current_user
		@current_user ||= Users.find_by_auth_token(cookies[:auth_token])
	end

	def signed_in?
		# this calls the current_user method, which calls the model to find a user
		# based on the cookie in the browser. if the model can't find a user that
		# matches, it will return nil. so, if it returns nil, we want this signed_in?
		# method to return false so it means that user is not signed in.
		!current_user.nil
	end

	def sign_out
		@current_user = nil
		cookies.delete(:auth_token)
	end
end
