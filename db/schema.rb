# encoding: UTF-8
ActiveRecord::Schema.define(version: 20141002155319) do
  enable_extension "plpgsql"

  create_table "albums", force: true do |t|
    t.string   "name",       null: false
    t.integer  "band_id",    null: false
    t.string   "type",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "albums", ["name"], name: "index_albums_on_name", unique: true, using: :btree

  create_table "bands", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bands", ["name"], name: "index_bands_on_name", unique: true, using: :btree

  create_table "tracks", force: true do |t|
    t.string   "title",      null: false
    t.integer  "album_id",   null: false
    t.string   "type",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", using: :btree

end
