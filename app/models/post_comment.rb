class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  validates :comment, presence: true, length: { in: 1..140 }
  
  #投稿検索
  def self.looks(word)
    @comments = PostComment.where("comment LIKE?","%#{word}%")
  end
end
