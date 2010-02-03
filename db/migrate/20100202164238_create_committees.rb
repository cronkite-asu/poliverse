class CreateCommittees < ActiveRecord::Migration
  def self.up
    create_table :committees do |t|
      t.integer :level_id, :default => nil
      t.string :name, :limit => 200
      t.timestamps
    end
  end

  def self.down
    drop_table :committees
  end
end
