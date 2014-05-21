class AddCollege < ActiveRecord::Migration
  def change
  	add_column :acadamic_histories, :college, :string
  end
end
