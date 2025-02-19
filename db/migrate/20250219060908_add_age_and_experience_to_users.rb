class AddAgeAndExperienceToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :age, :integer
    add_column :users, :genre, :string
    add_column :users, :experience, :integer
  end
end
