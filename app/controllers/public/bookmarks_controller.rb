class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!
  
  def create
    post = Post.find(params[:post_id])
    bookmark = current_user.bookmarks.new(post_id: post.id)
    bookmark.save
    redirect_to request.referer
  end
  
  def index
    bookmarks = Bookmark.where(user_id: current_user.id).order(created_at: :desc).pluck(:post_id)
    @bookmarked_posts = Post.find(bookmarks)
  end
  
  def destroy
    post = Post.find(params[:post_id])
    bookmark = current_user.bookmarks.find_by(post_id: post.id)
    bookmark.destroy
    redirect_to request.referer
  end
end
