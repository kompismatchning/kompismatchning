class RenameMatchingsToMatches < ActiveRecord::Migration
  def change
    rename_table :matchings, :matches
  end
end
