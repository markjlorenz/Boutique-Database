class AddStreetNumberToStore < ActiveRecord::Migration
  def self.up
    add_column :stores, :street_number, :string
  end

  def self.down
    remove_column :stores, :street_number
  end
end
