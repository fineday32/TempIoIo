class MovePhotoToTalk < ActiveRecord::Migration
  def change
  	remove_column :speaker_profiles, :photo
  	add_column :talks, :photo, :string 
  end
end
