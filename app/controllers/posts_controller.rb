class PostsController < ApplicationController
	before_action :require_login, only: [:create, :edit, :update, :destroy]
	#before_action :check_auth, only: [:edit, :update, :destroy]
	protect_from_forgery

	def index
		@posts = Post.all
		authorize @post
	end

	def show
		@post = Post.find(params[:id])
		@user = User.find_by_id(@post.user_id)
		authorize @post
	end

	def new
		@city = City.find_by_name(params[:name])
		@post = Post.new
		authorize @post
	end

	def create
		@post = Post.new(posts_params)
		city = City.find_by_name(params[:name])
		@post.city_id = city.id
		@post.user_id = current_user.id
		if @post.save
			redirect_to city_path(city.name)
		else
			flash[:notice] = "Oops! Something went wrong! Try again!"
			redirect_to new_post_path
		end
	end

	def edit
		@post = Post.find_by_id(params[:id])
	end

	def update
		@post = Post.find_by_id(params[:id])
		authorize @post
		if @post.update(posts_params)
			flash[:notice] = "Updated successfully!"
			redirect_to user_path(@post.user_id)
		else
			flash[:notice] = "Oops! Something went wrong! Try again!"
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
		params.require(:post).permit(:title, :content)
	end

	# def check_auth
  #   @post = Post.find_by_id(params[:id])
  #   if current_user != @post.user
  #     flash[:notice] = "No hacking!"
  #     redirect_to login_path
  #   end
  # end


end
