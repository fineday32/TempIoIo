class AddPhotographyToTalk < ActiveRecord::Migration
    def self.up
        add_attachment :talks, :photography
    end
    def self.down
        remove_attachment :talks, :photography
    end
end
