class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
		@user = User.find_by_id(@post.user_id)
	end

	def new
		 @post = Post.new
	end

	def create
		@post = Post.new(posts_params)
		city = City.find_by_name(params[:name])
		@post.city_id = city.id
		@post.user_id = current_user.id
		if @post.save
			redirect_to city_path
		else
			flash[:notice] = "Try to create it again!"
			redirect_to new_post_path
		end
	end 

	def edit
		@post = Post.find_by_id(params[:id])
	end

	def update

	end

	def destroy
		post = Post.find_by(params[:id])
		post.delete


	end

	private

	def posts_params
		params.require(:post).permit(:title, :content, :city_id, :user_id)
	end

end
