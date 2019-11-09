class AddUniToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :university, :string
  end
end
