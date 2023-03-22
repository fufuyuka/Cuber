class Public::User::ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
  before_action :current_user!, except: [:show]
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc).page(params[:page])
    @favorites_count = Favorite.total_favorites(@user)
  end

  def edit
    @user = current_user #フォームに既存データを渡すために定義
  end
  
  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      @user = current_user
      render "edit"
    end
  end
  
  
  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:profiles)
  end
  
  def ensure_guest_user
    @user = current_user
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
