class AddSpeakerIdToTalk < ActiveRecord::Migration
  def change
      add_column :talks, :speaker_id, :integer
  end
end
