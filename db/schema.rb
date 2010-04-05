# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100405040606) do

  create_table "committee_memberships", :force => true do |t|
    t.integer  "committee_id",                    :null => false
    t.integer  "positician_id",                   :null => false
    t.boolean  "is_active",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "committees", :force => true do |t|
    t.integer  "level_id"
    t.string   "name",       :limit => 200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "counties", :force => true do |t|
    t.integer  "state_id"
    t.string   "name",       :limit => 200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faxes", :force => true do |t|
    t.integer  "politician_id", :null => false
    t.string   "label"
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "levels", :force => true do |t|
    t.string   "name",       :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parties", :force => true do |t|
    t.string   "name",         :limit => 100
    t.string   "abbreviation", :limit => 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phones", :force => true do |t|
    t.integer  "politician_id", :null => false
    t.string   "label"
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "politicians", :force => true do |t|
    t.integer  "party_id"
    t.integer  "county_id"
    t.string   "seat_title"
    t.string   "firstname",            :limit => 50
    t.string   "lastname",             :limit => 50
    t.string   "title",                :limit => 100
    t.string   "twitter",              :limit => 30
    t.string   "campaign_website",     :limit => 500
    t.string   "email",                :limit => 200
    t.string   "phone",                :limit => 30
    t.string   "fax",                  :limit => 30
    t.text     "politics"
    t.text     "committees"
    t.string   "governance"
    t.string   "governance_level"
    t.string   "contact_url",          :limit => 500
    t.string   "official_website",     :limit => 500
    t.string   "graphic_file_name",                   :default => "placeholder.png"
    t.string   "graphic_content_type"
    t.integer  "graphic_file_size"
    t.datetime "graphic_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "bio"
    t.string   "uuid_key"
  end

  create_table "seat_types", :force => true do |t|
    t.string   "name",       :limit => 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seats", :force => true do |t|
    t.integer  "level_id",                    :null => false
    t.integer  "seat_type_id",                :null => false
    t.integer  "state_id"
    t.string   "name",         :limit => 200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string   "name",         :limit => 100
    t.string   "abbreviation", :limit => 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "typus_users", :force => true do |t|
    t.string   "first_name",       :default => "",    :null => false
    t.string   "last_name",        :default => "",    :null => false
    t.string   "role",                                :null => false
    t.string   "email",                               :null => false
    t.boolean  "status",           :default => false
    t.string   "token",                               :null => false
    t.string   "salt",                                :null => false
    t.string   "crypted_password",                    :null => false
    t.string   "preferences"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_sessions", ["session_id"], :name => "index_user_sessions_on_session_id"
  add_index "user_sessions", ["updated_at"], :name => "index_user_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login",                            :null => false
    t.string   "email",                            :null => false
    t.string   "crypted_password",                 :null => false
    t.string   "password_salt",                    :null => false
    t.string   "persistence_token",                :null => false
    t.integer  "login_count",       :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
  end

  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

end
