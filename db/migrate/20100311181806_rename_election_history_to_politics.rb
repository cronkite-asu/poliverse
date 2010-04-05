class RenameElectionHistoryToPolitics < ActiveRecord::Migration
  def self.up
    rename_column :politicians, :election_history, :politics
  end

  def self.down
    rename_column :politicians, :politics, :election_history
  end
end
