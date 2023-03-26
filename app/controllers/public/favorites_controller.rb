class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!
  #renderやredirect_toがない場合/アクション名.js.erbを参照する(非同期通信)
  def create
    @post = Post.find(params[:post_id])
    favirite = current_user.favorites.new(post_id: @post.id)
    favirite.save
  end
  
  def index
    @user = User.find(params[:user_id])
    favorites = Favorite.where(user_id: @user).order(created_at: :desc).pluck(:post_id)
    @favorited_posts = Post.where(id: favorites).page(params[:page])
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: @post.id)
    favorite.destroy
  end
end
