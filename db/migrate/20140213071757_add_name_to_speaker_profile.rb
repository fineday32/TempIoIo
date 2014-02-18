class AddNameToSpeakerProfile < ActiveRecord::Migration
  def change
  end
  add_column :speaker_profiles, :eng_name , :string
  add_column :speaker_profiles, :chi_name , :string
end
