class UpdateColTweets < ActiveRecord::Migration[6.0]
  def change
    change_table :tweets do |t|
      t.string :twitter_username
    end
  end
end
