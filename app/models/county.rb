# == Schema Information
# Schema version: 20100202164256
#
# Table name: counties
#
#  id         :integer(4)      not null, primary key
#  state_id   :integer(4)      not null
#  name       :string(200)
#  created_at :datetime
#  updated_at :datetime
#

class County < ActiveRecord::Base
  belongs_to :state
end
