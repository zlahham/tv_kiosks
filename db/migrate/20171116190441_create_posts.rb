class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :content
      t.datetime :date
      t.integer :category
      t.integer :duration
      t.datetime :expires_on

      t.timestamps
    end
  end
end
