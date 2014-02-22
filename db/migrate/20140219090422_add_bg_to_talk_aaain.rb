class AddBgToTalkAaain < ActiveRecord::Migration
  def change
  	add_column :talks ,  	:bg_file_name , :string
    add_column :talks ,		:bg_content_type , :string
    add_column :talks ,		:bg_file_size  ,:integer
    add_column :talks ,		:bg_updated_at ,:datetime
  end
end
