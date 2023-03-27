class Public::User::SettingsController < ApplicationController
  before_action :authenticate_user!, except: [:logout]
  
  def edit
    flash.clear #サインインなどのフラッシュを一度リセット
    @user = current_user #フォームに既存データを渡すために
  end

  def update 
    update = user_update_params
    @user = current_user
    #現passwordの一致確認
    unless @user.valid_password?(update[:password]) && update[:email]&.include?('@') #&.で存在確認してからinclude
      flash[:notice] = "現在のパスワードが一致しないか、有効なメールアドレスではありません。"
      render :edit
      return
    end
    #新パスワードの入力があるか
    unless update[:new_password].present? || update[:new_password_confirmation].present?
      current_user.update(email: update[:email])
      flash[:notice] = "メールアドレスを更新しました。"
      render :edit 
      return
    end
    #確認用と一致している&6文字以上
    if match_password?(update[:new_password],update[:new_password_confirmation]) && update[:new_password].size > 6
      flash[:notice] = "メールアドレスとパスワードを更新しました。ログインページへ移動します。"
      @user.update(email: update[:email])
    else
      flash[:notice] = "【注意！】更新できませんでした。最初から入力してください。"
    end
    render :edit #renderなのでflash.clearされない
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
  
  def user_update_params
    params.require(:user).permit(:email,:password,:new_password,:new_password_confirmation)
  end
  
  def match_password?(password,password_confirmation)
    if password == password_confirmation
      @user.password = password
      @user.password_confirmation = password_confirmation
    end
  end
  
end
