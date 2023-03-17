class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
  end
  
  def comments
    @user = User.find(1)
    #@user = User.find(params[:id])
    @comments = PostComment.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user.save(user_params)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name)
  end
end
