class AddNotesToStore < ActiveRecord::Migration
  def self.up
    add_column :stores, :notes, :text
  end

  def self.down
    remove_column :stores, :notes
  end
end
