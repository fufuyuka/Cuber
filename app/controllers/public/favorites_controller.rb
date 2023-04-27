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
    @favorited_posts = Post.eager_load(:favorites) # eager_loadで@favorited_postsにfavoritesをjoinする
                       .where(favorites: { user: @user }) # joinしたfavoritesをwhere(@userのidを持つ)で絞り込み
                       .where(status: 0) #さらにステータスがactiveのみに絞り込み
                       .order('favorites.created_at desc') #favoriteのcreated_atでソート
                       .page(params[:page])
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: @post.id)
    favorite.destroy
  end
end
