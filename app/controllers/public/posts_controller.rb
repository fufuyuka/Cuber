class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @post = Post.find(params[:id])
    @new_comment = PostComment.new
    @comments = @post.post_comments
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
    @new_post = Post.new
    @posts = Post.all.order(created_at: :desc)
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
      redirect_to posts_path #遷移元によって遷移先を変えたい
  end
  
  private
  
  def post_params
    params.require(:post).permit(:statement)
  end
end
