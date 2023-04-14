class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  validates :comment, presence: true, length: { in: 1..140 }
  
  enum status: { active: 0, deletion: 1, ban: 2 }
  
  #投稿検索
  def self.looks(search,word)
    if search == "perfect_match"
      @comments = PostComment.where(status: "active").where(comment: word).order(created_at: :desc)
    else
      @comments = PostComment.where(status: "active").where("comment LIKE?","%#{word}%").order(created_at: :desc)
    end
  end
end
