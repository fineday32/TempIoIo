class AddUserTalkIdToUsertalk < ActiveRecord::Migration
  def change
  	add_column :usertalks , :user_id, :integer
  	add_column :usertalks, :talk_id, :integer

  end
end
