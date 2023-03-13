class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = current_user
    @post = Post.find(params[:id])
  end
  
  def create
    @new_post = Post.new(post_params)
    @new_post.user_id = current_user.id
    if @new_post.save
      redirect_to post_path(@new_post)
    else
      @posts = Post.all
      render 'index'
    end
  end

  def index
    @user = current_user
    @new_post = Post.new
    @posts = Post.all
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:statement)
  end
end
