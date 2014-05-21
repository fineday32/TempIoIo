class AddSpeakerInfoDetails < ActiveRecord::Migration
  def change
  	add_column :speaker_profiles, :phone, :string 
  	add_column :speaker_profiles, :email, :string
  	add_column :speaker_profiles, :recommend_name, :string
  	add_column :speaker_profiles, :recommend_phone, :string
  	add_column :speaker_profiles, :recommend_email, :string
  	add_column :speaker_profiles, :recommend_reason, :string
  	add_column :speaker_profiles, :OS, :string
  	add_column :speaker_profiles, :give_live_talk, :string
  	add_column :speaker_profiles, :current_work, :string
  	add_column :speaker_profiles, :time_for_talk, :string
  	add_column :speaker_profiles, :other_recommend, :string
  end
end
