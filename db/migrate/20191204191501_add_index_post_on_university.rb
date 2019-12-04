class AddIndexPostOnUniversity < ActiveRecord::Migration[6.0]
  def change
    add_index :posts, :university
  end
end
