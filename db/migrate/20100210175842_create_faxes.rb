class CreateFaxes < ActiveRecord::Migration
  def self.up
    create_table :faxes do |t|
      t.integer :politician_id, :null => false
      t.string :label
      t.string :number
      t.timestamps
    end
  end

  def self.down
    drop_table :faxes
  end
end
