class Post < ApplicationRecord
  belongs_to :user
  belongs_to :puzzle_category, optional: true #nilでも登録できる
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :bookmarks, dependent: :destroy
  has_many :post_comments
  
  validates :statement, presence: true, length: { in: 1..140 }
  
  enum status: { active: 0, deletion: 1, ban: 2 }

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
  end

  #投稿検索
  def self.looks(search,word)
    if search == "perfect_match"
      @posts = Post.where(status: "active").where(statement: word).order(created_at: :desc)
    else
      @posts = Post.where(status: "active").where("statement LIKE?","%#{word}%").order(created_at: :desc)
    end
  end
end
