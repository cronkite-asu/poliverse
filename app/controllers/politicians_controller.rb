class PoliticiansController < ApplicationController
  
  caches_action :azhouse, :azsenate, :uscongress, :local, :congressional_governance, :legislative_governance, :county_governance
  
  def index
    if params[ :governance ] != nil
      case params[ :governance_level ]
        when 'Congressional district'
          @politicians = Politician.find( :all, :include => [ :party, :phones, :faxes ], :conditions => [ 'governance = ? and governance_level IN ( ? )', params[ :governance ], [ 'U.S. House of Representatives', 'U.S. Senate' ] ], :order => "lastname asc" )
        when 'Legislative district'
          @politicians = Politician.find( :all, :include => [ :party, :phones, :faxes ], :conditions => [ 'governance = ? and governance_level IN ( ? )', params[ :governance ], [ 'Arizona House', 'Arizona Senate' ] ], :order => "lastname asc" )
        when 'County'
          @politicians = Politician.find( :all, :include => [ :party, :phones, :faxes ], :conditions => [ 'governance = ? and governance_level NOT IN ( ? )', params[ :governance ], Seat.seat_titles ], :order => "lastname asc" )
      end
    else
      @politicians = Politician.find( :all, :include => [ :party, :phones, :faxes ], :order => "lastname asc" )
    end
    
    respond_to do | format |
      format.json { render :json => { :results => @politicians }.to_json }
    end
  end
  
  def azhouse
    @politicians = Politician.find( :all, :include => :party, :conditions => [ 'governance_level = ?', 'Arizona House' ], :order => "lastname asc" )
    
    respond_to do | format |
      format.json { render :json => { :results => @politicians }.to_json }
    end
  end
  
  def azsenate
<<<<<<< HEAD
    @politicians = Politician.find( :all, :include => [ :phones, :faxes, :party ], :conditions => [ 'governance_level = ?', 'Arizona Senate' ], :order => "lastname asc" )
=======
    @politicians = Politician.find( :all, :include => :party, :conditions => [ 'governance_level = ?', 'Arizona Senate' ], :order => "lastname asc" )
>>>>>>> 68b99136c5e4991e6b843082c4e8f8c00cc088b0
    
    respond_to do | format |
      format.json { render :json => { :results => @politicians }.to_json }
    end
  end
  
  def uscongress
     @politicians = Politician.find( :all, :include => :party, :conditions => [ "governance_level IN ( 'U.S. House of Representatives', 'U.S. Senate'  )" ] )
    
    respond_to do | format |
      format.json { render :json => { :results => @politicians }.to_json }
    end
  end
  
  def local
    @politicians = Politician.find( :all, :include => :party, :conditions => [ 'governance_level NOT IN ( ? )', Seat.seat_titles ], :order => "lastname asc" )
    
    respond_to do | format |
      format.json { render :json => { :results => @politicians }.to_json }
    end
  end
  
  def congressional_governance
    @governance = Politician.connection.select_all( "select distinct( governance ) from politicians where governance_level IN ( 'U.S. House of Representatives', 'U.S. Sentate' ) order by governance asc" )
    
    respond_to do | format |
      format.json { render :json => { :results => @governance }.to_json }
    end
  end
  
  def legislative_governance
    @governance = Politician.connection.select_all( "select distinct( governance ) from politicians where governance_level IN ( 'Arizona House', 'Arizona Senate' ) order by abs( replace( governance, 'District', '' ) ) asc" )
    
    respond_to do | format |
      format.json { render :json => { :results => @governance }.to_json }
    end
  end
  
  def county_governance
    @governance = Politician.connection.select_all( "select distinct( governance ) from politicians where governance_level NOT IN ( 'Arizona House', 'Arizona Senate', 'U.S. House of Representatives', 'U.S. Senate' ) and governance != 'Arizona' order by governance asc" )
    
    respond_to do | format |
      format.json { render :json => { :results => @governance }.to_json }
    end
  end
  
  def gps
    
    url = URI.parse( 'http://173.203.212.119:8000' )
    res = Net::HTTP.start( url.host, url.port ) do | http |
      http.get( '/polytest/matchLayers?lat=' + params[ :lat ] + '&lng=' + params[ :lng ] )
    end
    
    #@politician = Politician.find( :all, :include => :party, :conditions => [ '' ] )
    res_response = JSON.parse( res.body )
    congressional_district = res_response[ "Congressional" ]
    counties = res_response[ "Counties" ][0] + " County" 
    legislative_district = res_response[ "Legislative" ]
    
    congressional_politicians = Politician.find( :all, :include => :party, :conditions => [ "( governance = ? and governance_level IN ( 'U.S. House of Representatives', 'U.S. Senate'  ) ) or ( governance = 'Arizona' and governance_level = 'U.S. Senate' )", "District #{ congressional_district }" ], :order => "lastname asc" )
    county_politicians = Politician.find( :all, :include => :party, :conditions => [ "governance = ? and governance_level NOT IN ( 'Arizona', 'Arizona House', 'Arizona Senate', 'U.S. House of Representatives', 'U.S. Senate' )", counties ], :order => "lastname asc" )
    legislative_politicians = Politician.find( :all, :include => :party, :conditions => [ "governance = ? and governance_level IN ( 'Arizona House', 'Arizona Senate' )", "District #{ legislative_district }" ], :order => "lastname asc" )
    @politicians = []
    @politicians.concat( congressional_politicians )
    @politicians.concat( county_politicians )
    @politicians.concat( legislative_politicians )
    
    respond_to do | format |
      format.json { render :json => { :results => @politicians }.to_json }
    end
    
  end
  
  def update_remote_db
    
    politicians = Politicians.find( :all, :conditions => [ 'uuid_key in ( ? ) and updated_at >= ?', params[ :remote_update ][ :uuid_key ], params[ :remote_update ][ :updated_at ] ] )
    
    respond_to do | format |
      format.json { render :json => politicians }
    end
    
  end
  
end

