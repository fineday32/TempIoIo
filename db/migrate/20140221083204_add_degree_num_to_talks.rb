class AddDegreeNumToTalks < ActiveRecord::Migration
  def change
  	add_column :talks, :degree_id, :integer
  end
end
