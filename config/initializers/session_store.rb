# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_semantix_session',
  :secret      => '4f69221b37860083e9ad1522ce0afba8e8655bc9c35913226be78fa1b179bd22d96e76cb4889c2d8ee0ad614986c387f0e12a42c67b6fad04a9192ef0890aa8a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
