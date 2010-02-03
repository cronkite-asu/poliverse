class CreateSeatTypes < ActiveRecord::Migration
  def self.up
    create_table :seat_types do |t|
      t.string :name, :limit => 50
      t.timestamps
    end
  end

  def self.down
    drop_table :seat_types
  end
end
