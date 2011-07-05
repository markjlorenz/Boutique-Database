class AddAbbToDesigner < ActiveRecord::Migration
  def self.up
    add_column :designers, :abb, :string
  end

  def self.down
    remove_column :designers, :abb
  end
end
