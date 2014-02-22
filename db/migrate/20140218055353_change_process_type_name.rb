class ChangeProcessTypeName < ActiveRecord::Migration
  def change
  	rename_column :process_lists , :type, :process_type
  end
end
