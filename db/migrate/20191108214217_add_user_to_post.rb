class AddUserToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :user, :int
  end
end
