class PuzzleCategory < ApplicationRecord
  has_many :post
  
  #投稿検索
  def self.looks(word)
    @category = PuzzleCategory.where("category LIKE?","#{word}")
    @posts = Post.where(puzzle_category_id: @category.id)
  end
end