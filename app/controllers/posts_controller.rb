class PostsController < ApplicationController
	before_action :private_access, except:[:index, :show]
	def index
		@posts = Post.order(created_at: :asc)
		@time = Time.now.utc
		# @time = Time.now.utc.to_i
		# @time1 =Time.at(1524153419).strftime("%B %e, %Y at %I:%M %p")	
	end

	def show
		@post = Post.find(params[:id])	
	end

	def new
		@post = Post.new		
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user
		if @post.save
			redirect_to root_path
		else
			render :new
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to root_path
		else
			render :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy	
		redirect_to root_path	
	end

	private
		def post_params
			params.require(:post).permit(:title, :body)			
		end

end
