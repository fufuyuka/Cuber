class PuzzleCategory < ApplicationRecord
  has_many :post
  
  validates :category, uniqueness: true, presence: true, length: { maximum: 20 }
  
  #投稿検索
  # def self.looks(word)
  #   @category = PuzzleCategory.where("category LIKE?","#{word}")
  #   @posts = Post.where(puzzle_category_id: @category.id)
  # end
  
  def self.looks(word)
    categorys = PuzzleCategory.where("category LIKE?","%#{word}%").pluck(:id)
    @posts = Post.where(post_id: categorys)
  end
end