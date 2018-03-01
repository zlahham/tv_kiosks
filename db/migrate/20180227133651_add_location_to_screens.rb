class AddLocationToScreens < ActiveRecord::Migration[5.1]
  def change
  	add_column :screens, :location, :string
  end
end
