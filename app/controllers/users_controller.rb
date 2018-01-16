class UsersController < ApplicationController

  #before_action :require_login, only: [:show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    WelcomeMailer.welcome_email(@user).deliver_later
    login(@user)
    redirect_to user_path(@user)
  end


  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash[:notice] = "Unable to edit"
      redirect_to edit_user_path(@user)
    end
  end

    def destroy
      @user = User.find_by_id(params[:id])
      @user.destroy
      redirect_to root_path
    end

  private

  def user_params
    params.require(:user).permit(:avatar, :first_name, :last_name, :email, :user_city, :password)
  end

end
