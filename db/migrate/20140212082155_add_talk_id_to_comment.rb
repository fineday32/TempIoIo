class AddTalkIdToComment < ActiveRecord::Migration
  def change
  	add_column :comments , :talk_id, :integer
  end
end
