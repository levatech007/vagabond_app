class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:notice] = 'You are not authorized to perform this action.'
    redirect_back(fallback_location: root_path)
 end

  include SessionsHelper

  private

  def require_login
    unless logged_in?
      flash[:notice] = "Please log in to see this page"
      redirect_to login_path
    end
  end

end
