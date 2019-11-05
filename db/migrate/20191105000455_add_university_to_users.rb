class AddUniversityToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :university_acronym, :string
  end
end
