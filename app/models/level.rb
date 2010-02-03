# == Schema Information
# Schema version: 20100202164256
#
# Table name: levels
#
#  id         :integer(4)      not null, primary key
#  name       :string(20)
#  created_at :datetime
#  updated_at :datetime
#

class Level < ActiveRecord::Base
end
