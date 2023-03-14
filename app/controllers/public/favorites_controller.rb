class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def create
  end
  
  def index
    @user = User.find(params[:user_id])
  end
  
  def destroy
  end
end
