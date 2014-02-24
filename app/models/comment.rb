class Comment < ActiveRecord::Base
	belongs_to :talk
	has_many :usercomments
	
end
