namespace :db do
  
  namespace :convert do
  
    desc "Convert db to SQLite"
    task :sqlite => :environment do
     
      require 'sqlite3'
           
      db = SQLite3::Database.new( "db/azpolitics.db" )    
     
      politicians = Politician.all
      phones = Phone.all
      faxes = Fax.all
      parties = Party.all

      sql = ""
      stmt = db.prepare( "insert into politicians ( party_id, firstname, lastname, title, twitter, campaign_website, email, committees, governance, governance_level, contact_url, official_website ) values ( :party_id, :firstname, :lastname, :title, :twitter, :campaign_website, :email, :committees, :governance, :governance_level, :contact_url, :official_website );" )

      politicians.each do | p |
        
        stmt.execute( :party_id => p.party_id, :firstname => p.firstname, :lastname => p.lastname, :title => p.title, :twitter => p.twitter, :campaign_website => p.campaign_website,  :email => p.email, :committees => p.committees, :governance => p.governance, :governance_level => p.governance_level, :contact_url => p.contact_url, :official_website => p.official_website );

      end

    end

  end

end
