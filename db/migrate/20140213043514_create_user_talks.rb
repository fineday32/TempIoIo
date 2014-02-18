class CreateUserTalks < ActiveRecord::Migration
  def change
    create_table :user_talks do |t|

      t.timestamps
    end
    add_column :user_talks , :user_id , :integer
    add_column :user_talks , :talk_id , :integer
  end
end
