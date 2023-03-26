class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  validates_uniqueness_of :post_id, scope: :user_id
  
  #人からもらったいいねの合計
  def self.total_favorites(current_user)
    favorites_count = 0
    current_user.posts.each do |post|
      favorites_count += post.favorites.count
    end
    favorites_count
  end

end
