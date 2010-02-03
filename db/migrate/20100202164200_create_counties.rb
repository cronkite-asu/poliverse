class CreateCounties < ActiveRecord::Migration
  def self.up
    create_table :counties do |t|
      t.integer :state_id, :default => nil
      t.string :name, :limit => 200
      t.timestamps
    end
  end

  def self.down
    drop_table :counties
  end
end
