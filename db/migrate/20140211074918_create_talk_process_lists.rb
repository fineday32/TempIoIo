class CreateTalkProcessLists < ActiveRecord::Migration
  def change
    create_table :talk_process_lists do |t|
      t.integer :talk_id
      t.integer :process_id

      t.timestamps
    end
  end
end
