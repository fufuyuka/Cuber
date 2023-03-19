class PuzzleCategory < ApplicationRecord
  has_many :post
  
  validates :category, uniqueness: true, presence: true, length: { in: 1..20 }
  
  #投稿検索
  def self.looks(word)
    category_ids = PuzzleCategory.where("category LIKE ?","%#{word}%").ids
    @posts = Post.where(puzzle_category_id: category_ids)
  end
end
