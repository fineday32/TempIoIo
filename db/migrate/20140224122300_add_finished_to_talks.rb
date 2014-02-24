class AddFinishedToTalks < ActiveRecord::Migration
  def change
  	add_column :talks, :finished, :boolean
  end
end
