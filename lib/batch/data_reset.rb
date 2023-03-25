class Batch::DataReset
  # guestuserの投稿を削除
  def self.data_reset
    user = User.find(1)
    user.posts.destroy_all
    user.post_comments.destroy_all
    user.favorites.destroy_all
    user.bookmarks.destroy_all
  end
  
  def self.logout
    user = User.find(1)
    sign_out(user)
  end
end
