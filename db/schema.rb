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

ActiveRecord::Schema.define(version: 20150930040223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"
  enable_extension "fuzzystrmatch"

  create_table "animes", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "episodes"
    t.string   "status"
    t.date     "start_aired"
    t.date     "end_aired"
    t.integer  "producer_id"
    t.string   "duration"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "slug"
  end

  create_table "animes_genres", id: false, force: true do |t|
    t.integer "anime_id"
    t.integer "genre_id"
  end

  add_index "animes_genres", ["anime_id", "genre_id"], name: "index_animes_genres_on_anime_id_and_genre_id", using: :btree
  add_index "animes_genres", ["genre_id"], name: "index_animes_genres_on_genre_id", using: :btree

  create_table "genres", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pg_search_documents", force: true do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_id", "searchable_type"], name: "index_pg_search_documents_on_searchable_id_and_searchable_type", using: :btree

  create_table "producers", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.text     "address"
    t.string   "telephone"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "username"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "avatar"
    t.string   "slug"
    t.boolean  "admin",                  default: false
    t.integer  "braintree_customer_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

  create_table "videos", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "file"
    t.integer  "anime_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_tmp"
  end

end
