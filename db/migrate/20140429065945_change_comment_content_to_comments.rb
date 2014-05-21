class ChangeCommentContentToComments < ActiveRecord::Migration
  def change
  	rename_column :comments, :content, :comments
  end
end
