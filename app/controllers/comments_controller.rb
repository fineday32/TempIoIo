class CommentsController < ApplicationController
	def index
		@comments = current_user.comments
	end

	def new
		@talk_id = Talk.find(params[:id])
		@comment = Comment.new
		
		respond_to do |format|
  		format.html
  		format.js
  		end
	end

	def create
		@comment = Comment.new
		@comment.comments = params.permit![:comment_content][:comments]
		@comment.talk_id = params.permit![:comment_content][:talk_id]
		@comment.user_id = current_user.id
    	
    	@comment.save!
    	
    	redirect_to :back
    
	end

	def show
	end
end
