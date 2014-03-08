class AddStatusRoleToUsercomment < ActiveRecord::Migration
  def change
  	add_column :usercomments , :role , :string
  	add_column :usercomments , :status , :string 
  	
  end
end
