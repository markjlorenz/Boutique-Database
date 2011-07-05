class CreateTouches < ActiveRecord::Migration
  def self.up
    create_table :touches do |t|
      t.text :notes
      t.datetime :at
      t.references :campaign
      t.references :store
      t.references :employee

      t.timestamps
    end
  end

  def self.down
    drop_table :touches
  end
end
