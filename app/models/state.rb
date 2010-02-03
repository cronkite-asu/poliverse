# == Schema Information
# Schema version: 20100202164256
#
# Table name: states
#
#  id           :integer(4)      not null, primary key
#  name         :string(100)
#  abbreviation :string(10)
#  created_at   :datetime
#  updated_at   :datetime
#

class State < ActiveRecord::Base
end
