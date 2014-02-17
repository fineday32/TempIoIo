class Talk < ActiveRecord::Base
	has_many :usertalks
	has_many :users , :through => :usertalks
	has_many :talk_process_lists
	has_many :processes , :through => :talk_process_lists
	has_many :comments 
end
