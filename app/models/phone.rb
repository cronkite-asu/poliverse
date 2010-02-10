# == Schema Information
# Schema version: 20100209213704
#
# Table name: phones
#
#  id            :integer(4)      not null, primary key
#  politician_id :integer(4)      not null
#  label         :string(255)
#  number        :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Phone < ActiveRecord::Base
  belongs_to :politician
end
