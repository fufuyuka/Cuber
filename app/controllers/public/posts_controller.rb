class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  
  def show
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
  end
  
  def destroy
  end
  
  private
  
  def post_params
    params.require(:post).permit(:statement)
  end
end
