# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170819045130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", id: :serial, force: :cascade do |t|
    t.string "comment"
    t.integer "user_id"
    t.integer "setlist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["setlist_id"], name: "index_comments_on_setlist_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "setlist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["setlist_id"], name: "index_favorites_on_setlist_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "set_list_tracks", id: :serial, force: :cascade do |t|
    t.integer "track_id"
    t.integer "setlist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["setlist_id"], name: "index_set_list_tracks_on_setlist_id"
    t.index ["track_id"], name: "index_set_list_tracks_on_track_id"
  end

  create_table "setlists", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "venue_id"
    t.integer "user_id"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "votes"
    t.string "favorites"
    t.string "artist"
    t.string "artist_photo"
    t.index ["user_id"], name: "index_setlists_on_user_id"
    t.index ["venue_id"], name: "index_setlists_on_venue_id"
  end

  create_table "tracks", id: :serial, force: :cascade do |t|
    t.string "title"
    t.integer "setlist_id"
    t.string "album"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "spotify_track_id"
    t.string "uri"
    t.index ["setlist_id"], name: "index_tracks_on_setlist_id"
    t.index ["user_id"], name: "index_tracks_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "name"
    t.string "token"
    t.datetime "token_expiry"
    t.string "refresh_token"
    t.string "uri"
    t.string "country"
    t.string "spotify_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venues", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "lat"
    t.string "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "setlist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["setlist_id"], name: "index_votes_on_setlist_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "comments", "setlists"
  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "setlists"
  add_foreign_key "favorites", "users"
  add_foreign_key "set_list_tracks", "setlists"
  add_foreign_key "set_list_tracks", "tracks"
  add_foreign_key "setlists", "users"
  add_foreign_key "setlists", "venues"
  add_foreign_key "tracks", "setlists"
  add_foreign_key "tracks", "users"
  add_foreign_key "votes", "setlists"
  add_foreign_key "votes", "users"
end
