class CreateDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :departments do |t|
      t.string :name
      t.string :colour
      t.string :code

      t.timestamps
    end
  end
end
