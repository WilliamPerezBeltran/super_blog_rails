class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@post.comments.create(comment_params)
		redirect_to @post
	end

	private 
		def comment_params
			params.require(:comment).permit(:comment_body).merge(user: current_user)
		end
end
