class AddStatusToPostComments < ActiveRecord::Migration[6.1]
  def change
    add_column :post_comments, :status, :integer, null: false, default: "0"
  end
end
