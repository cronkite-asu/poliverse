class CreateSeats < ActiveRecord::Migration
  def self.up
    create_table :seats do |t|
      t.integer :level_id, :null => false
      t.integer :seat_type_id, :null => false
      t.integer :state_id, :default => nil
      t.string :name, :limit => 200
      t.timestamps
    end
  end

  def self.down
    drop_table :seats
  end
end
