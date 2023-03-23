class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!

#renderやredirect_toがない場合/アクション名.js.erbを参照する(非同期通信)
  def create
    @post = Post.find(params[:post_id])
    bookmark = current_user.bookmarks.new(post_id: @post.id)
    bookmark.save
  end
  
  def index
    bookmarks = Bookmark.where(user_id: current_user.id).order(created_at: :desc).pluck(:post_id)
    @bookmarked_posts = Post.where(id: bookmarks).page(params[:page])
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    bookmark = current_user.bookmarks.find_by(post_id: @post.id)
    bookmark.destroy
  end
end
