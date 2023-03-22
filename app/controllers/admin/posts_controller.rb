class Admin::PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(user_id: @user.id).order(created_at: :desc).page(params[:page])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    redirect_to request.referer
  end
end
