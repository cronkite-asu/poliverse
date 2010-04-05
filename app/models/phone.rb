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
  
  before_save :set_uuid
  
  private
  
  def set_uuid
    self.politician.uuid_key = UUIDTools::UUID.timestamp_create.to_s
    self.politician.save!
  end
  
end
