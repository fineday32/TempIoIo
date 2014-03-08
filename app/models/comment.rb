class Comment < ActiveRecord::Base
	belongs_to :talk
	has_many :usercomments
	has_one :user, :through => :usercomments

	
	def self.get_by_owner(talk)
		 usercomments = Array.new
		 are_owners = Usercomment.where(:comment_id=>Comment.where(:talk_id => talk.id).select(:id)).where(:role=>"owner")
		 
		 are_owners.each do |s|
		 	usercomments << s
		 end
		 usercomments
	end
end
