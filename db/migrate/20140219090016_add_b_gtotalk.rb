class AddBGtotalk < ActiveRecord::Migration
  def change
  	def self.up
    add_attachment :talks, :bg
  end

  def self.down
    remove_attachment :talks, :bg
  end
  end
end
