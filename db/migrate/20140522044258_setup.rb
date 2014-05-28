class Setup < ActiveRecord::Migration
  def change
	  create_table "acadamic_histories" do |t|
	    t.integer  "speaker_profile_id"
	    t.string   "school"
	    t.string   "department"
	    t.string   "year"
	    t.string   "degree"
	    t.string   "nation"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.string   "college"
	  end

	  create_table "alert_rules" do |t|
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.string   "content"
	    t.string   "rule_type"
	  end

	  create_table "all_processes" do |t|
	    t.string   "title"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end

	  create_table "comment_rule_fireds" do |t|
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end

	  create_table "comments" do |t|
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.string   "comments"
	    t.integer  "talk_id"
	    t.string   "comment_type"
	    t.integer  "rule_id"
	    t.integer  "user_id"
	  end

	  create_table "process_lists" do |t|
	    t.integer  "sequence"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.integer  "all_process_id"
	    t.integer  "process_type_id"
	  end

	  create_table "process_types" do |t|
	    t.string   "title"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end

	  create_table "processes" do |t|
	    t.string "title"
	  end

	  create_table "rules_fireds" do |t|
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end

	  create_table "speaker_creators" do |t|
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end

	  create_table "speaker_profiles" do |t|
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

	  create_table "talk_process_lists" do |t|
	    t.integer  "talk_id"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.boolean  "finished"
	    t.date     "finished_date"
	    t.integer  "sequence"
	    t.string   "process_name"
	    t.integer  "all_process_id"
	  end

	  create_table "talks" do |t|
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

	  create_table "user_talks" do |t|
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.integer  "user_id"
	    t.integer  "talk_id"
	  end
  end
end
