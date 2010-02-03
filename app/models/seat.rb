# == Schema Information
# Schema version: 20100202164256
#
# Table name: seats
#
#  id           :integer(4)      not null, primary key
#  level_id     :integer(4)      not null
#  seat_type_id :integer(4)      not null
#  name         :string(200)
#  created_at   :datetime
#  updated_at   :datetime
#

class Seat < ActiveRecord::Base
  belongs_to :level
  belongs_to :seat_type
end
