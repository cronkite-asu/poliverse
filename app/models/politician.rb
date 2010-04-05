# == Schema Information
# Schema version: 20100209213704
#
# Table name: politicians
#
#  id                   :integer(4)      not null, primary key
#  party_id             :integer(4)
#  county_id            :integer(4)
#  seat_title           :string(255)
#  firstname            :string(50)
#  lastname             :string(50)
#  title                :string(100)
#  twitter              :string(30)
#  campaign_website     :string(500)
#  email                :string(200)
#  phone                :string(30)
#  fax                  :string(30)
#  election_history     :text
#  committees           :text
#  governance           :string(255)
#  governance_level     :string(255)
#  contact_url          :string(500)
#  official_website     :string(500)
#  graphic_file_name    :string(255)     default("placeholder.png")
#  graphic_content_type :string(255)
#  graphic_file_size    :integer(4)
#  graphic_updated_at   :datetime
#  created_at           :datetime
#  updated_at           :datetime
#

class Politician < ActiveRecord::Base
  belongs_to :party
  has_many :phones
  has_many :faxes
  has_attached_file :graphic, :styles => { :fullsize => "69x104>", :thumb => "48x72>" }
  
  before_save :set_uuid
  
  def to_json( options = {} )
    { :id => id, :party => "(#{ party.abbreviation })", :title => "#{ firstname } #{ lastname }", :photo => 'http://67.23.22.72' + graphic.url( :fullsize ), :firstname => firstname, :lastname => lastname, :seat => governance_level + ', ' + governance, :governance => governance, :governance_level => governance_level, :hasChild => true, :fontSize => 16, :phones => phones, :faxes => faxes, :email => email, :bio => bio, :politics => politics, :committees => committees.gsub( "\n", "").gsub( "\r", "" ), :official_website => official_website, :campaign_website => campaign_website }.to_json
  end
  
  private
  
  def set_uuid
    self.uuid_key = UUIDTools::UUID.timestamp_create.to_s
  end
    
end
