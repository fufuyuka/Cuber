class Admin::PostCommentsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @comments = PostComment.where(user_id: @user.id)
  end
  
  def destroy
    @comment = PostComment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end
end
