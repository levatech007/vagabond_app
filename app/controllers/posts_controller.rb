class PostsController < ApplicationController
	before_action :require_login, only: [:create, :edit, :update, :destroy]

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
		@user = User.find_by_id(@post.user_id)
	end

	def new
		@city = City.find_by_name(params[:name])
		 @post = Post.new
	end

	def create
		@post = Post.new(posts_params)
		city = City.find_by_name(params[:name])
		@post.city_id = city.id
		@post.user_id = current_user.id
		if @post.save
			redirect_to city_path(city.name)
		else
			flash[:notice] = "Try to create it again!"
			redirect_to new_post_path
		end
	end

	def edit		
 		@post = Post.find_by_id(params[:id])		
 	end		
 		
 	def update		
 		post = Post.find_by_id(params[:id])		
 		
 		if post.update(posts_params)		
 			flash[:notice] = "Updated successfully!"		
 			redirect_to user_path(post.user_id)		
 		else		
 			flash[:notice] = "Try again!"		
 			redirect_to edit_post_path		
 		end		
 	end

	def destroy
		post = Post.find_by_id(params[:id])
		post.delete
		redirect_to user_path(post.user_id)		

	end

	private

	def posts_params
		params.require(:post).permit(:title, :content, :city_id, :user_id)
	end


end
