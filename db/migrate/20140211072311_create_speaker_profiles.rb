class CreateSpeakerProfiles < ActiveRecord::Migration
  def change
    create_table :speaker_profiles do |t|
      t.integer :user_id
      t.text :bio
      t.string :photo

      t.timestamps
    end
  end
end
