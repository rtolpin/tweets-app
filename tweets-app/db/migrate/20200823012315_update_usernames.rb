class UpdateUsernames < ActiveRecord::Migration[6.0]
  def change
    change_table :usernames do |t|
      t.string :handle
      t.string :category
      t.timestamp :last_checked_at
    end
  end
end
