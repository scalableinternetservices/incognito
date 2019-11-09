class RenamePostColumnUser < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :user, :user_id
  end
end
