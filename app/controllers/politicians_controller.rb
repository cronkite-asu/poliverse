class PoliticiansController < ApplicationController
  
  def index
    @politicians = Politician.find( :all, :include => :party )
    
    respond_to do | format |
      format.json { render :json => { :results => @politicians }.to_json }
    end
  end
  
  def azhouse
    @politicians = Politician.find( :all, :include => :party, :conditions => [ 'seat_title = ?', 'Arizona House' ] )
    
    respond_to do | format |
      format.json { render :json => { :results => @politicians }.to_json }
    end
  end
  
  def azsenate
    @politicians = Politician.find( :all, :include => :party, :conditions => [ 'seat_title = ?', 'Arizona Senate' ] )
    
    respond_to do | format |
      format.json { render :json => { :results => @politicians }.to_json }
    end
  end
  
  def uscongress
     @politicians = Politician.find( :all, :include => :party, :conditions => [ 'seat_title = ? or seat_title = ?', 'U.S House of Representatives', 'U.S. Senate' ] )
    
    respond_to do | format |
      format.json { render :json => { :results => @politicians }.to_json }
    end
  end
  
  def local
    @politicians = Politician.find( :all, :include => :party, :conditions => [ 'seat_title NOT IN ( ? )', Seat.seat_titles ] )
    
    respond_to do | format |
      format.json { render :json => { :results => @politicians }.to_json }
    end
  end
end
