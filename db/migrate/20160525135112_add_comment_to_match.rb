class AddCommentToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :comment, :string
  end
end
