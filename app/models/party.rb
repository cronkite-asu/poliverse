# == Schema Information
# Schema version: 20100202164256
#
# Table name: parties
#
#  id         :integer(4)      not null, primary key
#  name       :string(100)
#  created_at :datetime
#  updated_at :datetime
#

class Party < ActiveRecord::Base
end
