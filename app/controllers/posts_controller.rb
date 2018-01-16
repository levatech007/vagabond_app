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
    if current_user.id === params[:post][:user_id]
      Post.create(city_id: params[:post][:city_id], user_id: params[:post][:user_id])
      redirect_to post_path
    else
      flash[:notice] = "Error"
      redirect_to cities_path
    end
	end

end
