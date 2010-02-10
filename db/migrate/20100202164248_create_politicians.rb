class CreatePoliticians < ActiveRecord::Migration
  def self.up
    create_table :politicians do |t|
      t.integer :party_id, :default => nil
      t.integer :county_id, :default => nil
      t.string :seat_title, :default => nil
      t.string :firstname, :limit => 50
      t.string :lastname, :limit => 50
      t.string :title, :limit => 100
      t.string :twitter, :limit => 30
      t.string :campaign_website, :limit => 500
      t.string :email, :limit => 200
      t.string :phone, :limit => 30
      t.string :fax, :limit => 30
      t.text :election_history
      t.string :title => 100
      t.text :committees, :default => nil
      t.string :governance
      t.string :governance_level
      t.string :contact_url, :limit => 500
      t.string :official_website, :limit => 500
      t.string :graphic_file_name, :default => 'placeholder.png'
      t.string :graphic_content_type
      t.integer :graphic_file_size
      t.datetime :graphic_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :politicians
  end
end
