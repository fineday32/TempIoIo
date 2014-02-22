class ChangeFinishDateInProcessList < ActiveRecord::Migration
  def change
  	rename_column :talk_process_lists , :finishe_date , :finished_date
  end
end
