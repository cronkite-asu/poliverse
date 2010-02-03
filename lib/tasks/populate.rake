require 'fastercsv'

namespace :db do
  
  desc "Populate database with seed data."
  task :populate => [ :environment, :drop, :create, :migrate ] do

    # seed database
    committees = [ 'Appropriations', 'Banking and Insurance', 'Commerce', 'Commerce and Economic Development', 'Committee on Appropriations', 'Commmittee on Armed Services', 'Committee on Education and Labor', 'Committee on Energy and Commerce', 'Committee on Foreign Affairs', 'Committee on Homeland Security', 'Committee on Science and Technology', 'Education', 'Education Accountability and Reform', 'Environment', 'Finance', 'Government', 'Government Institutions', 'Health and Human Services', 'Healthcare and Medical Liability Reform', 'Judiciary', 'Military Affairs and Public Safety', 'Natural Resources and Rural Affairs', 'Public Employees, Retirement and Entitlement Reform', 'Rules', 'Transportation and Infrastructure' ]
    committees.each { | committee | Committee.new( :name => committee ).save! }
    
    counties = [ 'Apache County', 'Arizona', 'Cochise County', 'Coconino County', 'District 1', 'District 2', 'District 3', 'District 4', 'District 5', 'District 6', 'District 6', 'District 8', 'District 9', 'District 10', 'District 11', 'District 12', 'District 13', 'District 14', 'District 15', 'District 16', 'District 17', 'District 18', 'District 19', 'District 20', 'District 21', 'District 22', 'District 23', 'District 24', 'District 25', 'District 26', 'District 27', 'District 28', 'District 29', 'District 30', 'Gila County', 'Graham County', 'Greenlee County', 'La Paz', 'Maricopa County', 'Mohave County', 'Navajo County', 'Pima County', 'Pinal County', 'Yavapai County', 'Yuma County' ]
    counties.each { | county | County.new( :name => county ).save! }
    
    us_level = Level.new( :name => 'US' ).save!
    state_level = Level.new( :name => 'State' ).save!
    county_level = Level.new( :name => 'County' ).save!
    
    democratic_party = Party.new( :name => 'Democrat', :abbreviation => 'D' ).save!
    republican_party = Party.new( :name => 'Republican', :abbreviation => 'R' ).save!
    
    house_seat_type = SeatType.new( :name => 'House' ).save!
    senate_seat_type = SeatType.new( :name => 'Senate' ).save!
    office_seat_type = SeatType.new( :name => 'Office' ).save!
    
    az_state = State.new( :name => 'Arizona', :abbreviation => 'AZ' ).save!

    FasterCSV.foreach( File.join( File.dirname( __FILE__), 'assets', 'azpolitics.csv' ), :headers => :first_row ) do | row |
      politician = Politician.new( :firstname => row[ 'ZFIRSTNAME' ], :lastname => row[ 'ZLASTNAME' ], :twitter => row[ 'ZTWITTER' ], :campaign_website => row[ 'ZCAMPAIGN_WEBSITE' ], :email => row[ 'ZEMAIL' ], :election_history => row[ 'ZELECTION_HISTORY' ], :title => row[ 'ZTITLE' ], :contact_url => row[ 'ZCONTACT_FORM' ], :official_website => [ 'ZOFFICIAL_WEBSITE' ] )
      politician.party = Party.find_by_abbreviation( row[ 'ZPARTY' ] )
      politician.save!
    end
  end
  
end