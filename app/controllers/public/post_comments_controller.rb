class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @new_comment = PostComment.new(post_comment_params)
    @new_comment.user_id = current_user.id
    @new_comment.save
    redirect_to request.referer
  end
  
  def index
    @user = User.find(params[:user_id])
    @comments = @user.post_comments.order(created_at: :desc).page(params[:page])
  end
  
  def destroy
    @comment = PostComment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end
  
  def post_comment_params
    params.require(:post_comment).permit(:comment,:post_id)
  end

end
