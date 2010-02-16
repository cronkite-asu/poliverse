class PoliticiansController < ApplicationController
  
  caches_action :index, :azhouse, :azsenate, :uscongress, :local, :congressional_governance, :legislative_governance, :county_governance
  
  def index
    if params[ :governance ] != nil
      case params[ :governance_level ]
        when 'Congressional district'
          @politicians = Politician.find( :all, :include => [ :party, :phones, :faxes ], :conditions => [ 'governance = ? and governance_level IN ( ? )', params[ :governance ], [ 'U.S. House of Representatives', 'U.S. Senate' ] ] )
        when 'Legislative district'
          @politicians = Politician.find( :all, :include => [ :party, :phones, :faxes ], :conditions => [ 'governance = ? and governance_level IN ( ? )', params[ :governance ], [ 'Arizona House', 'Arizona Senate' ] ] )
        when 'County'
          @politicians = Politician.find( :all, :include => [ :party, :phones, :faxes ], :conditions => [ 'governance = ? and governance_level NOT IN ( ? )', params[ :governance ], Seat.seat_titles ] )
      end
    else
      @politicians = Politician.find( :all, :include => [ :party, :phones, :faxes ] )
    end
    
    respond_to do | format |
      format.json { render :json => { :results => @politicians }.to_json }
    end
  end
  
  def azhouse
    @politicians = Politician.find( :all, :include => :party, :conditions => [ 'governance_level = ?', 'Arizona House' ] )
    
    respond_to do | format |
      format.json { render :json => { :results => @politicians }.to_json }
    end
  end
  
  def azsenate
    @politicians = Politician.find( :all, :include => :party, :conditions => [ 'governance_level = ?', 'Arizona Senate' ] )
    
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
    @politicians = Politician.find( :all, :include => :party, :conditions => [ 'governance_level NOT IN ( ? )', Seat.seat_titles ] )
    
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
    
    url = URI.parse( 'http://67.23.22.72:8000' )
    res = Net::HTTP.start( url.host, url.port ) do | http |
      http.get( '/polytest/matchLayers?lat=' + params[ :lat ] + '&lng=' + params[ :lng ] )
    end
    
    #@politician = Politician.find( :all, :include => :party, :conditions => [ '' ] )
    res_response = JSON.parse( res.body )
    congressional_district = res_response[ "Congressional" ]
    counties = res_response[ "Counties" ]
    legislative_district = res_response[ "Legislative" ]
    
    congressional_politicians = Politician.find( :all, :include => :party, :conditions => [ "( governance = ? and governance_level IN ( 'U.S. House of Representatives', 'U.S. Senate'  ) ) or ( governance = 'Arizona' and governance_level = 'U.S. Senate' )", "District #{ congressional_district }" ] )
    county_politicians = Politician.find( :all, :include => :party, :conditions => [ "governance = ? and governance_level NOT IN ( ? )", counties, Seat.seat_titles ] )
    legislative_politicians = Politician.find( :all, :include => :party, :conditions => [ "governance = ? and governance_level IN ( 'Arizona House', 'Arizona Senate' )", "District #{ legislative_district }" ] )
    @politicians = []
    @politicians.concat( congressional_politicians )
    @politicians.concat( county_politicians )
    @politicians.concat( legislative_politicians )
    
    respond_to do | format |
      format.json { render :json => { :results => @politicians }.to_json }
    end
    
  end
  
end
