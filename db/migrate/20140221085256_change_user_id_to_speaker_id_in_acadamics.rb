class ChangeUserIdToSpeakerIdInAcadamics < ActiveRecord::Migration
  def change
  	rename_column :acadamic_histories, :user_id, :speaker_profile_id
  end
end
