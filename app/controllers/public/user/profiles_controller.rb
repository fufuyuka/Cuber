class Public::User::ProfilesController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = current_user
    @posts = @user.posts
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_my_page_path
    else
      render "edit"
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:profiles)
  end
end
