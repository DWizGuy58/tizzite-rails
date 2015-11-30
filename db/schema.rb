# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151123060338) do

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.float    "lat"
    t.float    "lon"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "body"
    t.integer  "sender_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "first_name"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",               default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.string   "last_name"
    t.string   "image"
    t.string   "location"
    t.string   "token"
    t.datetime "expires_at"
  end

  add_index "users", ["provider"], name: "index_users_on_provider"
  add_index "users", ["uid"], name: "index_users_on_uid"

end
