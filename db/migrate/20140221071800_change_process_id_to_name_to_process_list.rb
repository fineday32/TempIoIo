class ChangeProcessIdToNameToProcessList < ActiveRecord::Migration
  def change
  	remove_column :talk_process_lists, :process_id
  	add_column :talk_process_lists, :process_name, :string
  end
end
