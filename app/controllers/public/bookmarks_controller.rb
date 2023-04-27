class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!
  #renderやredirect_toがない場合/アクション名.js.erbを参照する(非同期通信)
  def create
    @post = Post.find(params[:post_id])
    bookmark = current_user.bookmarks.new(post_id: @post.id)
    bookmark.save
  end
  
  def index
    @bookmarked_posts = Post.eager_load(:bookmarks) # eager_loadで@bookmarked_postsにbookmarksをjoinする
                       .where(bookmarks: { user: current_user }) # joinしたbookmarksをwhere(current_userのidを持つ)で絞り込み
                       .where(status: 0) #さらにステータスがactiveのみに絞り込み
                       .order('bookmarks.created_at desc') #bookmarkのcreated_atでソート
                       .page(params[:page])
    
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    bookmark = current_user.bookmarks.find_by(post_id: @post.id)
    bookmark.destroy
  end
end
