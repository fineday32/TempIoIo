class CreateAcadamicHistories < ActiveRecord::Migration
  def change
    create_table :acadamic_histories do |t|
      t.integer :user_id
      t.string :school
      t.string :department
      t.string :year
      t.string :degree
      t.string :nation

      t.timestamps
    end
  end
end
