class AddUuidKeyToPoliticians < ActiveRecord::Migration
  def self.up
    add_column :politicians, :uuid_key, :string, :default => nil
  end

  def self.down
    remove_column :politicians, :uuid_key
  end
end
