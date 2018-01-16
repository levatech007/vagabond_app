class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
		@user = User.find_by_id(@post.user_id)

	end

	def create
		@post = Post.create(post_params)
			redirect_to post_path(@post)
	end

	private

	def post_params
		params.require(:post).permit(:title, :author, :content)
    end

end
