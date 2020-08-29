# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_23_021346) do

  create_table "tweets", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "conversation_tid"
    t.integer "tid"
    t.date "date"
    t.time "time"
    t.string "timezone"
    t.integer "username_id"
    t.string "username"
    t.text "tweet"
    t.string "place"
    t.integer "replies_count"
    t.integer "retweets_count"
    t.integer "likes_count"
    t.string "link"
    t.boolean "retweet"
    t.string "hashtags"
    t.string "urls"
    t.string "photos"
    t.string "twitter_username"
    t.index ["tid", "username"], name: "index_tweets_on_tid_and_username", unique: true
  end

  create_table "usernames", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "handle"
    t.string "category"
    t.datetime "last_checked_at"
  end

end
