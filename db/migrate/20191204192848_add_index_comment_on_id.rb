class AddIndexCommentOnId < ActiveRecord::Migration[6.0]
  def change
    add_index :comments, :id
  end
end
