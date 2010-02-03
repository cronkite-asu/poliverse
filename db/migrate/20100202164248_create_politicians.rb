class CreatePoliticians < ActiveRecord::Migration
  def self.up
    create_table :politicians do |t|
      t.integer :party_id, :null => false
      t.integer :seat_id, :null => false
      t.string :firstname, :limit => 50
      t.string :lastname, :limit => 50
      t.string :twitter, :limit => 30
      t.string :campaign_website, :limit => 500
      t.string :email, :limit => 200
      t.text :election_history
      t.string :title => 100
      t.string :graphic_file_name
      t.string :graphic_content_type
      t.string :graphic_file_size
      t.datetime :graphic_updated_at
      t.string :contact_url, :limit => 500
      t.string :official_website, :limit => 500
      t.timestamps
    end
  end

  def self.down
    drop_table :politicians
  end
end
