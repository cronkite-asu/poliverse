# == Schema Information
# Schema version: 20100202164256
#
# Table name: committees
#
#  id         :integer(4)      not null, primary key
#  level_id   :integer(4)      not null
#  name       :string(200)
#  created_at :datetime
#  updated_at :datetime
#

class Committee < ActiveRecord::Base
  belongs_to :level
end
