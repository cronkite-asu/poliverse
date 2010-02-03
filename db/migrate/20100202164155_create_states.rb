class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.string :name, :limit => 100
      t.string :abbreviation, :limit => 10
      t.timestamps
    end
  end

  def self.down
    drop_table :states
  end
end
