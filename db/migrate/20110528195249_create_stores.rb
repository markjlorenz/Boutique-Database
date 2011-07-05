class CreateStores < ActiveRecord::Migration
  def self.up
    create_table :stores do |t|
      t.string :phone
      t.string :address
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :stores
  end
end
