class ChangeFeedToken < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :feed_token, :feed_url
  end
end
