require 'fastercsv'

namespace :db do
  
  desc "Populate database with seed data."
  task :populate => [ :environment, :drop, :create, :migrate ] do
    
    # seed database
    
    az_state = State.new( :name => 'Arizona', :abbreviation => 'AZ' ).save!
    
    committees = [ 'Appropriations', 'Banking and Insurance', 'Commerce', 'Commerce and Economic Development', 'Committee on Appropriations', 'Commmittee on Armed Services', 'Committee on Education and Labor', 'Committee on Energy and Commerce', 'Committee on Foreign Affairs', 'Committee on Homeland Security', 'Committee on Science and Technology', 'Education', 'Education Accountability and Reform', 'Environment', 'Finance', 'Government', 'Government Institutions', 'Health and Human Services', 'Healthcare and Medical Liability Reform', 'Judiciary', 'Military Affairs and Public Safety', 'Natural Resources and Rural Affairs', 'Public Employees, Retirement and Entitlement Reform', 'Rules', 'Transportation and Infrastructure' ]
    committees.each { | committee | Committee.new( :name => committee ).save! }
    
    counties = [ 'Apache County', 'Arizona', 'Cochise County', 'Coconino County', 'District 1', 'District 2', 'District 3', 'District 4', 'District 5', 'District 6', 'District 6', 'District 7', 'District 8', 'District 9', 'District 10', 'District 11', 'District 12', 'District 13', 'District 14', 'District 15', 'District 16', 'District 17', 'District 18', 'District 19', 'District 20', 'District 21', 'District 22', 'District 23', 'District 24', 'District 25', 'District 26', 'District 27', 'District 28', 'District 29', 'District 30', 'Gila County', 'Graham County', 'Greenlee County', 'La Paz County', 'Maricopa County', 'Mohave County', 'Navajo County', 'Pima County', 'Pinal County', 'Yavapai County', 'Yuma County' ]
    counties.each { | county | County.new( :name => county, :state_id => az_state.id ).save! }
    
    us_level = Level.new( :name => 'US' ).save!
    state_level = Level.new( :name => 'State' ).save!
    county_level = Level.new( :name => 'County' ).save!
    
    democratic_party = Party.new( :name => 'Democrat', :abbreviation => 'D' ).save!
    republican_party = Party.new( :name => 'Republican', :abbreviation => 'R' ).save!
    
    house_seat_type = SeatType.new( :name => 'House' ).save!
    senate_seat_type = SeatType.new( :name => 'Senate' ).save!
    office_seat_type = SeatType.new( :name => 'Office' ).save!
  
    FasterCSV.foreach( File.join( File.dirname( __FILE__), 'assets', 'azpolitics.csv' ), :headers => :first_row ) do | row |
      #politician = Politician.find_or_create_by_email( row[ 'ZEMAIL' ] )
      #puts politician
      #puts row[ 'ZEMAIL' ]
      politician = Politician.new( :firstname => row[ 'ZFIRSTNAME' ], :lastname => row[ 'ZLASTNAME' ], :twitter => row[ 'ZTWITTER' ], :campaign_website => row[ 'ZCAMPAIGN_WEBSITE' ], :email => ( row[ 'ZEMAIL' ].strip == 'none listed'.strip ? ( row[ 'ZCONTACT_FORM' ] == nil ? 'none listed' : row[ 'ZCONTACT_FORM' ] ) : row[ 'ZEMAIL' ].strip ), :election_history => row[ 'ZELECTION_HISTORY' ], :title => row[ 'ZTITLE' ], :contact_url => row[ 'ZCONTACT_FORM' ], :official_website => row[ 'ZOFFICIAL_WEBSITE' ], :committees => row[ 'ZCOMMITTEES' ], :governance => row[ 'GOVERNANCE' ], :governance_level => row[ 'GOVERNANCE_LEVEL' ], :graphic_file_name => ( row[ 'ZIMAGE_FILENAME' ] == nil ? 'placeholder.png' : row[ 'ZIMAGE_FILENAME' ] ), :seat_title => row[ 'ZBODY' ] )
      politician.party = Party.find_by_abbreviation( row[ 'ZPARTY' ] )
      politician.county =  County.find_by_name( row[ 'ZDISTRICT' ] )
      row[ 'ZPHONE' ].split( "*" ).each do | s | 
        if s.strip! != nil
          if s.match( /:\((.*)\)/ ) != nil
            number = s.gsub( /:\((.*)\)/, "" )
            label = s.match( /:\((.*)\)/ )[1]
          else
            number = s
            label = "Primary"
          end
        else
          number = s
          label = "Primary"
        end
        politician.phones << Phone.new( :label => label, :number => number )
      end
      row[ 'ZFAX' ].split( "*" ).each do | s | 
        if s.strip! != nil
          if s.match( /:\((.*)\)/ ) != nil
            number = s.gsub( /:\((.*)\)/, "" )
            label = s.match( /:\((.*)\)/ )[1]
          else
            number = s
            label = "Primary"
          end
        else
          number = s
          label = "Primary"
        end
        politician.faxes << Fax.new( :label => label, :number => number )
      end
      politician.save!
      
      seats = []
      
    end
  end
  
end