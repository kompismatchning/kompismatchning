class AddConcludedAtToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :concluded_at, :datetime
  end
end
