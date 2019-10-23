class AddWriteToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :write, :boolean
  end
end
