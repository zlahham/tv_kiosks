class AddTwitterDisplayToDepartments < ActiveRecord::Migration[5.1]
  def change
  	add_column :departments, :twitter_handle, :string
  end
end
