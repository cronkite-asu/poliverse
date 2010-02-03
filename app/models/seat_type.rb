# == Schema Information
# Schema version: 20100202164256
#
# Table name: seat_types
#
#  id         :integer(4)      not null, primary key
#  name       :string(50)
#  created_at :datetime
#  updated_at :datetime
#

class SeatType < ActiveRecord::Base
end
