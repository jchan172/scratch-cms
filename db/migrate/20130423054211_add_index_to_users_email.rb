class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	add_index :users, :email, unique: true
  end
end

# Below is what 'rails generate migration add_index_to_users_email' created:

# class AddIndexToUsersEmail < ActiveRecord::Migration
#   def change
#   end
# end
