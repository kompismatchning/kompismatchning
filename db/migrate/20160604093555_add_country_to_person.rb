class AddCountryToPerson < ActiveRecord::Migration
  def change
    add_column :people, :country, :string
  end
end
