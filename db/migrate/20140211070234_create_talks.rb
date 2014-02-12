class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :title
      t.text :intro
      t.string :bg
      t.string :poster
      t.string :slide1
      t.string :slide2
      t.string :slide3
      t.string :videourl1
      t.string :videourl2
      t.string :videourl3
      t.text :videocomment1
      t.text :videocomment2
      t.text :videocomment3
      t.string :feedback1
      t.string :feedback2
      t.string :feedback3
      t.datetime :signup

      t.timestamps
    end
  end
end
