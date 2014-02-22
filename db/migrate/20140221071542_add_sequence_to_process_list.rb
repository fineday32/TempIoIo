class AddSequenceToProcessList < ActiveRecord::Migration
  def change
  	add_column :talk_process_lists, :sequence, :integer
  end
end
