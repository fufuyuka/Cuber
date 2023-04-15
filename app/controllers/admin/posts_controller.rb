class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(user_id: @user.id).order(created_at: :desc).page(params[:page])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.update(status: "ban") #ステータス変更
    redirect_to request.referer
  end
  
  #再表示
  def update
    @post = Post.find(params[:id])
    @post.update(status: "active") #ステータス変更
    redirect_to request.referer
  end
end
