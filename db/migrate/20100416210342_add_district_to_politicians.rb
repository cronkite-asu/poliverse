class AddDistrictToPoliticians < ActiveRecord::Migration
  def self.up

    add_column :politicians, :district, :string, :default => nil
  
  end

  def self.down

    remove_column :politicians, :district

  end
end
