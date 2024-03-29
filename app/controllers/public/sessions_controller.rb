# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_user, only: [:create] #退会済みのユーザー
  
  def after_sign_in_path_for(resource)
    posts_path
  end
  
  def after_sign_out_path_for(resource)
    user_logout_path
  end

  protected
  
  # 論理削除済みのuserへ
  def reject_user
    @user = User.find_by(email: params[:user][:email])
    if @user && !params[:user][:password].blank?
      if @user.valid_password?(params[:user][:password]) && (@user.user_status == "withdrawal")
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_user_session_path
      elsif @user.valid_password?(params[:user][:password]) && (@user.user_status == "ban")
        flash[:notice] = "こちらのアカウントは利用停止されました。"
        redirect_to new_user_session_path
      else
      end
    else
      flash[:notice] = "正しい情報を入力してください"
    end
  end
  
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
