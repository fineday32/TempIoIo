class TalksAddAcadamicHistoryId < ActiveRecord::Migration
  def change
  	add_column :talks, :acadamic_history_id, :int
  	add_column :acadamic_histories, :talk_id, :int
  end
end
