class CountiesController < ApplicationController

  def congressional_districts
    @counties = County.find( :all, :condition => [] )
  end
  
  def legislative_districts
    
  end
  
  def county_districts
    
  end

end
