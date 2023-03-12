class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!
  
  def create
  end
  
  def index
    @user = current_user
  end
  
  def destroy
  end
end
