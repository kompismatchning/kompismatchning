class RemoveStatusFromMatch < ActiveRecord::Migration[5.0]
  def change
    remove_column :matches, :status, :integer
  end
end
