class CommentsController < ApplicationController
	def index
		@comments = current_user.comments
	end
	def new
		@comment = Comment.new
	end
	def create
	end
	def show
	end
end
