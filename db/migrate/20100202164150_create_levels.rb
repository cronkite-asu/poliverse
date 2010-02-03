class CreateLevels < ActiveRecord::Migration
  def self.up
    create_table :levels do |t|
      t.string :name, :limit => 20
      t.timestamps
    end
  end

  def self.down
    drop_table :levels
  end
end
