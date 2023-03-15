class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  #人からもらったいいねの合計
  def total_favorited
    @favorites_count = 0
    @user.posts.each do |post|
      @favorites_count += post.favorites.count
    end
  end
  
end
