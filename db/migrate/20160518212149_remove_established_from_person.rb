class RemoveEstablishedFromPerson < ActiveRecord::Migration
  def change
    remove_column :people, :established, :boolean
  end
end
