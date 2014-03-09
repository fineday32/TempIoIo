class CreateSpeakerCreators < ActiveRecord::Migration
  def change
    create_table :speaker_creators do |t|

      t.timestamps
    end
  end
end
