class CommentsController < ApplicationController
	def index
		@comments = current_user.comments
	end
	def new
		@comment = Comment.new
		@talk = Talk.
		respond_to do |format|
  		format.html
  		format.js
  	end
	end
	def create
		@comment = Comment.new(params.permit![:comment])
    	@comment.save!
    	
    	redirect_to :back
    
	end
	def show
	end
end
