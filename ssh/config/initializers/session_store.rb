# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ssh_session',
  :secret      => 'e78c178e8ebd620b9caea482fde53060a5eb23e0a8eb3ab1d2f73fbf9a56f7057f1dcc554955711a02421255cbcdd577e5fd0a33009dca9b2493f570bd7b5727'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
