# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_poliverse_session',
  :secret      => 'a3d2220a979340f7690e99731b2267fc6275b78757106632dccd21f98237f6dfa0f8272158e68a45d08a1c6219fb5933c6a907f0ec1001d7264aa9a66db1d018'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
