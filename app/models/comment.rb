class Comment < ActiveRecord::Base
	has_many :usercomments
	has_many :user , :through => :usercomments
	belongs_to :talk
end

