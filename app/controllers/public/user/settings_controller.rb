class Public::User::SettingsController < ApplicationController
  before_action :authenticate_user!, except: [:logout]
  before_action :ensure_guest_user, only: [:edit]
  
  def edit
    flash.clear #サインインなどのフラッシュを一度リセット
    @user = current_user #フォームに既存データを渡すために
  end

  def update
    #現passwordの一致確認 ※passwordは特殊なので更新が難しい
    if current_user.valid_password?(params[:user][:password])
      #新パスワードの入力があり、確認用と一致している場合new_passwordを渡す
      # if params[:user][:new_password].present? && params[:user][:new_password_confirmation].present?
      #     current_user.password = params[:user][:new_password]
      #     current_user.password_confirmation = params[:user][:new_password_confirmation]
      # else
      #   flash[:notice] = "確認用パスワードが一致しません。"
      #   redirect_to edit_user_settings_path
      # end

      current_user.update(email: params[:user][:email])
      flash[:notice] = "メールアドレスを変更しました"
      @user = current_user
      render :edit #renderなのでflash.clearされない
    else
      flash[:notice] = "現在のパスワードが一致しません。"
      @user = current_user
      render :edit
    end
  end
  
  def logout
  end
  
  def withdrawal
    current_user.update(user_status: "withdrawal") #ステータス変更
    sign_out
    render :withdrawal #退会完了画面へ
  end


  private

  def user_params
    params.require(:user).permit(:email,:password)
  end
  
  def ensure_guest_user
    @user = current_user
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはユーザー設定画面へ遷移できません。'
    end
  end
end
