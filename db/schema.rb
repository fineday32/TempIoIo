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

ActiveRecord::Schema.define(version: 20140528093721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acadamic_histories", force: true do |t|
    t.integer  "speaker_profile_id"
    t.string   "school"
    t.string   "department"
    t.string   "year"
    t.string   "degree"
    t.string   "nation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "college"
    t.string   "region"
  end

  create_table "alert_rules", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content"
    t.string   "rule_ide_type"
  end

  create_table "all_processes", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comment_rule_fireds", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "comments"
    t.string   "talk_id"
    t.string   "comment_type"
    t.integer  "rule_id"
    t.integer  "user_id"
  end

  create_table "process_lists", force: true do |t|
    t.integer  "sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "all_process_id"
    t.integer  "process_type_id"
  end

  create_table "process_types", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "processes", force: true do |t|
    t.string "title"
  end

  create_table "rules_fireds", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "speaker_creators", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "speaker_profiles", force: true do |t|
    t.integer  "user_id"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "eng_name"
    t.string   "chi_name"
    t.string   "phone"
    t.string   "email"
    t.string   "recommend_name"
    t.string   "recommend_phone"
    t.string   "recommend_email"
    t.string   "recommend_reason"
    t.string   "OS"
    t.string   "give_live_talk"
    t.string   "current_work"
    t.string   "time_for_talk"
    t.string   "other_recommend"
  end

  create_table "talk_process_lists", force: true do |t|
    t.integer  "talk_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "finished"
    t.date     "finished_date"
    t.integer  "sequence"
    t.string   "process_name"
    t.integer  "all_process_id"
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
    t.string   "photography_file_name"
    t.string   "photography_content_type"
    t.integer  "photography_file_size"
    t.datetime "photography_updated_at"
    t.integer  "speaker_profile_id"
    t.string   "photo"
    t.string   "bg_file_name"
    t.string   "bg_content_type"
    t.integer  "bg_file_size"
    t.datetime "bg_updated_at"
    t.integer  "degree_id"
    t.boolean  "finished"
    t.boolean  "paused"
    t.date     "paused_till"
    t.integer  "acadamic_history_id"
  end

  create_table "user_talks", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "talk_id"
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
    t.string   "admin"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
