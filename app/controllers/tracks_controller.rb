class TracksController < ApplicationController
	before_action :set_setlist, only:[:index] 
  def index
    p @setlist
    artist_search = RSpotify::Artist.search(@setlist.artist)
    artist = artist_search.first
    @albums = artist.albums(limit: 50, country: current_user.market)
    # @setlist.tracks.nil? ? @tracks = [] : @tracks = @setlist.tracks
  end
  def addTracks
    track_params[:tracks].each do |track|
      if Track.find(track) != nil
        Track.create(track) 
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_setlist
    @setlist = Setlist.find(params[:setlist_id])
  end
  def track_params
    params.require(:track).permit(:title, :artist, :user_id, :album, :setlist_id, :spotify_track_id, :tracks)
  end
end
