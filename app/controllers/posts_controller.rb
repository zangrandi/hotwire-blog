class PostsController < ApplicationController
  before_action :authenticate_user

  def index
    @posts = Post.includes(:user).order(created_at: :desc)
  end

  def create
    @post = current_user.posts.create(post_params)

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
