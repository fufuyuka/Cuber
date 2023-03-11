class Public::User::SettingsController < ApplicationController
  def edit
    @user = current_user
  end

  def update
  end
end
