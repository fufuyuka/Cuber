class AddCategoryToPuzzleCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :puzzle_categories, :category, :string
  end
end
