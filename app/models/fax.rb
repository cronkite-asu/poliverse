# == Schema Information
# Schema version: 20100211014027
#
# Table name: faxes
#
#  id            :integer(4)      not null, primary key
#  politician_id :integer(4)      not null
#  label         :string(255)
#  number        :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Fax < ActiveRecord::Base
  belongs_to :politician
end
