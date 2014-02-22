class AddFinishedAndDateToProcessList < ActiveRecord::Migration
  def change
  	add_column :talk_process_lists , :finished, :boolean
  	add_column :talk_process_lists , :finishe_date, :date
  end
end
