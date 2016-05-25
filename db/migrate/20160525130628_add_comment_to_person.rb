class AddCommentToPerson < ActiveRecord::Migration
  def change
    add_column :people, :comment, :string
  end
end
