class Public::FavoritesController < ApplicationController
  def create
  end
  
  def index
    @user = current_user
  end
  
  def destroy
  end
end
