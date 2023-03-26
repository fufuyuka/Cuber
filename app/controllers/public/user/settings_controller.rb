class Public::User::SettingsController < ApplicationController
  before_action :authenticate_user!, except: [:logout]
  before_action :ensure_guest_user, only: [:edit]
  
  def edit
    flash.clear #サインインなどのフラッシュを一度リセット
    @user = current_user #フォームに既存データを渡すために
  end

  def update
    #現passwordの一致確認
    if current_user.valid_password?(params[:user][:password])
      #新パスワードの入力があるか
      if params[:user][:new_password].present? && params[:user][:new_password_confirmation].present?
        #確認用と一致しているか
        if params[:user][:new_password] == params[:user][:new_password_confirmation]
          current_user.password = params[:user][:new_password]
          current_user.password_confirmation = params[:user][:new_password_confirmation]
        else
          flash[:notice] = "【注意！】新パスワード(確認用)が一致しません。メールアドレスのみ更新しました。"
          current_user.update(email: params[:user][:email])
          @user = current_user
          render :edit #renderなのでflash.clearされない
          return
        end
        
      else
        current_user.update(email: params[:user][:email])
        flash[:notice] = "メールアドレスを更新しました。"
        @user = current_user
        render :edit #renderなのでflash.clearされない
        return
      end
      
      if current_user.email == params[:user][:email]
        current_user.update(email: params[:user][:email])
        flash[:notice] = "パスワードを更新しました。ログインページへ移動します。"
        @user = current_user
        render :edit #renderなのでflash.clearされない
      else
        current_user.update(email: params[:user][:email])
        flash[:notice] = "メールアドレスとパスワードを更新しました。ログインページへ移動します。"
        @user = current_user
        render :edit #renderなのでflash.clearされない
      end
      
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
end