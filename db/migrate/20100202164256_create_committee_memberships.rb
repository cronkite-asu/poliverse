class CreateCommitteeMemberships < ActiveRecord::Migration
  def self.up
    create_table :committee_memberships do |t|
      t.integer :committee_id, :null => false
      t.integer :positician_id, :null => false
      t.boolean :is_active, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :committee_memberships
  end
end
