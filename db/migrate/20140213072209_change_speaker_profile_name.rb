class ChangeSpeakerProfileName < ActiveRecord::Migration
  def change
      rename_column :talks , :speaker_id, :speaker_profile_id
  end
end
