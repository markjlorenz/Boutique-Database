class CreateDesignersStores < ActiveRecord::Migration
  def self.up
    create_table :designers_stores do |t|
      t.integer :store_id
      t.integer :designer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :designers_stores
  end
end
