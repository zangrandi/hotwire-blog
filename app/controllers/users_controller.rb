class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index, :logout]

  def index
    @users = User.order(created_at: :desc)
  end

  def create
    @user = User.create(user_params)

    session[:current_user_id] = @user.id if @user.persisted?

    respond_to do |format|
      format.turbo_stream
    end
  end

  def login
  end

  def logout
    session[:current_user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
