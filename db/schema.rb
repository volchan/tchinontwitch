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

ActiveRecord::Schema.define(version: 20170621161955) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dungeons", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "raids", force: :cascade do |t|
    t.integer  "dungeon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "difficulty"
    t.integer  "leader_id"
    t.integer  "faction"
    t.datetime "date"
    t.index ["dungeon_id"], name: "index_raids_on_dungeon_id", using: :btree
  end

  create_table "realms", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.integer  "toon_id"
    t.integer  "raid_id"
    t.integer  "status",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["raid_id"], name: "index_tags_on_raid_id", using: :btree
    t.index ["toon_id"], name: "index_tags_on_toon_id", using: :btree
  end

  create_table "toons", force: :cascade do |t|
    t.string   "name"
    t.integer  "class_id"
    t.integer  "race_id"
    t.integer  "level"
    t.integer  "i_level"
    t.string   "thumbnail"
    t.integer  "faction"
    t.integer  "tag_status"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "spec_name"
    t.string   "spec_role"
    t.string   "spec_icon"
    t.string   "guild_name"
    t.string   "guild_realm"
    t.integer  "realm_id"
    t.index ["realm_id"], name: "index_toons_on_realm_id", using: :btree
    t.index ["user_id"], name: "index_toons_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "username"
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  add_foreign_key "raids", "dungeons"
  add_foreign_key "tags", "raids"
  add_foreign_key "tags", "toons"
  add_foreign_key "toons", "realms"
  add_foreign_key "toons", "users"
end
