class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper
  # no UsersHelper included here

  private

  def require_login
    unless logged_in?
      flash[:notice] = "Please log in to see this page"
      redirect_to login_path
    end
  end

end
