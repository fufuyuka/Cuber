class Post < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  # has_many :favorited_users, through: :favorites, source: :user
  has_many :post_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
  end
  
  #投稿検索
  def self.looks(word)
    @posts = Post.where("statement LIKE?","%#{word}%")
  end
  
end
