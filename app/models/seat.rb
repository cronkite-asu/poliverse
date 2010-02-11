# == Schema Information
# Schema version: 20100202164256
#
# Table name: seats
#
#  id           :integer(4)      not null, primary key
#  level_id     :integer(4)      not null
#  seat_type_id :integer(4)      not null
#  state_id     :integer(4)
#  name         :string(200)
#  created_at   :datetime
#  updated_at   :datetime
#

class Seat < ActiveRecord::Base
  belongs_to :level
  belongs_to :seat_type
  @@seat_titles = [ 'Arizona House', 'Arizona Senate', 'U.S. House of Representatives', 'U.S. Senate' ]
  
  def self.seat_titles
    @@seat_titles
  end
end