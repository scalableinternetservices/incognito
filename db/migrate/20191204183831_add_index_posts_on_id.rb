class AddIndexPostsOnId < ActiveRecord::Migration[6.0]
  def change
    add_index :posts, :post_id
  end
end