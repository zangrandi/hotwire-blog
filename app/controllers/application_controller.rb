class ApplicationController < ActionController::Base
  helper_method :current_user

  protected

  def current_user
    User.find_by(id: session[:current_user_id])
  end

  def authenticate_user
    redirect_to root_path unless current_user
  end
end
