class CreateParties < ActiveRecord::Migration
  def self.up
    create_table :parties do |t|
      t.string :name, :limit => 100
      t.string :abbreviation, :limit => 10
      t.timestamps
    end
  end

  def self.down
    drop_table :parties
  end
end
