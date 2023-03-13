class Public::User::SettingsController < ApplicationController
  before_action :authenticate_user!
  
  def edit
    @user = current_user
  end

  def update
    #現passwordの一致確認 ※passwordは特殊なので更新が難しい
    if current_user.valid_password?(params[:user][:password])
    #   #新パスワードの入力があり、確認用と一致している場合new_passwordを渡す
    #   if params[:user][:new_password].present? && params[:user][:new_password_confirmation].present?
    #       current_user(password: params[:user][:new_password])
    #   else
    #     flash[:notice] = "確認用パスワードが一致しません。"
    #     redirect_to edit_user_settings_path
    #   end
      
      current_user.update(email: params[:user][:email])
      flash[:notice] = "メールアドレスをを変更しました"
      redirect_to  edit_user_settings_path
    else
      flash[:notice] = "現在のパスワードが一致しません。"
      redirect_to edit_user_settings_path
    end
  end
  
  def withdrawal
    @user = current_user
    @user.update(user_status: "withdrawal") #ステータス変更
    sign_out
    render :withdrawal #退会完了画面へ
  end


  private

  def user_params
    params.require(:user).permit(:email,:password)
  end
end
