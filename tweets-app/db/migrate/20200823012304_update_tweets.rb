class UpdateTweets < ActiveRecord::Migration[6.0]
  def change
    change_table :tweets do |t|
      t.integer :conversation_tid
      t.integer :tid
      t.date :date
      t.time :time
      t.string :timezone
      t.integer :username_id
      t.text :tweet
      t.string :place
      t.integer :replies_count
      t.integer :retweets_count
      t.integer :likes_count
      t.string :link
      t.boolean :retweet
      t.string :hashtags
      t.string :urls
      t.string :photos
    end
    add_index :tweets, [:tid, :username], :unique => true
  end
end
