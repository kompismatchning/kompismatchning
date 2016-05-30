class AddCommentToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :comment, :text
  end
end
