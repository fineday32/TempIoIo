class CreateProcessLists < ActiveRecord::Migration
  def change
    create_table :process_lists do |t|
      t.string :title
      t.string :type
      t.integer :sequence

      t.timestamps
    end
  end
end
