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

ActiveRecord::Schema.define(version: 20140211083929) do

  # These are extensions that must be enabled in order to support this database


  create_table "acadamic_histories", force: true do |t|
    t.integer  "user_id"
    t.string   "school"
    t.string   "department"
    t.string   "year"
    t.string   "degree"
    t.string   "nation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "content"
    t.string   "type"
    t.string   "importance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "process_lists", force: true do |t|
    t.string   "title"
    t.string   "type"
    t.integer  "sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "speaker_profiles", force: true do |t|
    t.integer  "user_id"
    t.text     "bio"
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "talk_process_lists", force: true do |t|
    t.integer  "talk_id"
    t.integer  "process_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "talks", force: true do |t|
    t.string   "title"
    t.text     "intro"
    t.string   "bg"
    t.string   "poster"
    t.string   "slide1"
    t.string   "slide2"
    t.string   "slide3"
    t.string   "videourl1"
    t.string   "videourl2"
    t.string   "videourl3"
    t.text     "videocomment1"
    t.text     "videocomment2"
    t.text     "videocomment3"
    t.string   "feedback1"
    t.string   "feedback2"
    t.string   "feedback3"
    t.datetime "signup"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usercomments", force: true do |t|
    t.integer  "user_id"
    t.integer  "comment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "usertalks", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "talk_id"
  end

end
