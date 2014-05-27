class Comment < ActiveRecord::Base
	belongs_to :talk
	#has_many :userc, :useromments
	belongs_to :user # :through => :usercomment

	
	def self.get_by_talk(talk)
		allCommentsWithNames = Array.new
		allUserComments = Comment.where(:talk_id => talk.id)
		#are_owners = Usercomment.where(:comment_id=>Comment.where(:talk_id => talk.id).select(:id)).where(:role=>"owner")
		allUserComments.each do |f|
			allCommentsWithNames << [User.find(f.user_id).name, f.comments, f.updated_at]
			# Each comment contains [Name, Content, Time]
		end
		allCommentsWithNames
		# are_owners.each do |s|
		# 	usercomments << s
		# end
		# usercomments
	end

	def self.add_new_comment(talk)

	end
end
