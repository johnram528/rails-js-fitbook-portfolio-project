class IndexOnEmailIsNotUnique < ActiveRecord::Migration
  def change
    remove_index "users", :name =>"index_users_on_email" 
    add_index "users", ["email", "provider", "uid"], :name => "index_users_on_identity", :unique => true
  end
end
