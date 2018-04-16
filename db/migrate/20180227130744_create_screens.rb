class CreateScreens < ActiveRecord::Migration[5.1]
  def change
    create_table :screens do |t|

      t.references :department
      t.string :name

      t.timestamps
    end

    add_index :screens, :name, unique: true
  end
end
