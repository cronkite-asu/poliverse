# == Schema Information
# Schema version: 20100202164256
#
# Table name: committee_memberships
#
#  id            :integer(4)      not null, primary key
#  committee_id  :integer(4)      not null
#  positician_id :integer(4)      not null
#  is_active     :boolean(1)      default(TRUE)
#  created_at    :datetime
#  updated_at    :datetime
#

class CommitteeMembership < ActiveRecord::Base
  belongs_to :committee
  belongs_to :polititcian
end
