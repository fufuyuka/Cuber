class PuzzleCategory < ApplicationRecord
  has_many :post
  
  validates :category, uniqueness: true, presence: true, length: { in: 1..20 }
  
  #投稿検索
  def self.looks(search,word)
    if search == "perfect_match"
      category_ids = PuzzleCategory.where("category LIKE ?","#{word}").ids
      @posts = Post.where(puzzle_category_id: category_ids).order(created_at: :desc)
    else
      category_ids = PuzzleCategory.where("category LIKE ?","%#{word}%").ids
      @posts = Post.where(puzzle_category_id: category_ids).order(created_at: :desc)
    end
  end
end
