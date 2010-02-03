# == Schema Information
# Schema version: 20100202164256
#
# Table name: politicians
#
#  id                   :integer(4)      not null, primary key
#  party_id             :integer(4)      not null
#  seat_id              :integer(4)      not null
#  firstname            :string(50)
#  lastname             :string(50)
#  twitter              :string(30)
#  campaign_website     :string(500)
#  email                :string(200)
#  election_history     :text
#  graphic_file_name    :string(255)
#  graphic_content_type :string(255)
#  graphic_file_size    :string(255)
#  graphic_updated_at   :datetime
#  contact_url          :string(500)
#  official_website     :string(500)
#  created_at           :datetime
#  updated_at           :datetime
#

class Politician < ActiveRecord::Base
  belongs_to :party
  belongs_to :seat
end
