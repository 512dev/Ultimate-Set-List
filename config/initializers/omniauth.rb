require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET'], scope: 'playlist-read-private user-read-private user-read-email playlist-modify-public'
end