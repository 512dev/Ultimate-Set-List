class AddSpotifyTrackIdToTrack < ActiveRecord::Migration[5.0]
  def change
  	add_column :tracks, :spotify_track_id, :string
  end
end
