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
  belongs_to :seat
  belongs_to :county
  has_many :phones
  has_attached_file :graphic, :styles => { :fullsize => "69x104>", :thumb => "48x72>" }
  
  def to_json( options = {} )
    { :id => id, :party => "(#{ party.abbreviation })", :title => "#{ firstname } #{ lastname }", :photo => "bios/placeholder.png", :firstname => firstname, :lastname => lastname, :seat => governance_level + ' ' + governance, :hasChild => true, :fontSize => 16, :phone => "555-555-5555", :fax => "555-555-5555", :email => email, :committees => committees.gsub!( "\n", ", "), :official_website => official_website }.to_json
  end
  
end
