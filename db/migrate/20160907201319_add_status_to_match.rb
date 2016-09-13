class AddStatusToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :status, :integer
  end
end
