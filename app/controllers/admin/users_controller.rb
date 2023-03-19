class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
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
    if @user.update(user_params)
      redirect_to admin_user_path(@user)
    else
      render "edit"
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:profile_image,:profiles)
  end
end
