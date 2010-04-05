class AddBioFieldToPoliticians < ActiveRecord::Migration
  def self.up
    add_column :politicians, :bio, :text
  end

  def self.down
    remove_column :politicians, :bio
  end
end
