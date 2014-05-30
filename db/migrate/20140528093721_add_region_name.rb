class AddRegionName < ActiveRecord::Migration
  def change
  	add_column :acadamic_histories, :region, :string
  end
end
