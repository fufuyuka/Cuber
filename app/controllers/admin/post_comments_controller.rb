class Admin::PostCommentsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @comments = PostComment.where(user_id: @user.id).order(created_at: :desc)
  end
  
  def destroy
    @comment = PostComment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end
end
