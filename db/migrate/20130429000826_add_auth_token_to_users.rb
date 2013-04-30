class AddAuthTokenToUsers < ActiveRecord::Migration
  def change
  	# add authentication token to users
  	add_column	:users, :auth_token, :string
  	# index the token because we need to search for it later (always index if you need to search)
  	add_index	:users, :auth_token
  end
end
