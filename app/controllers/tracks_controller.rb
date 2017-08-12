class TracksController < ApplicationController
  before_action :set_setlist, only: [:index, :create]
  before_action :set_user, only: [:create]
  def index
    @tracks = @setlist.tracks
    artist_search = RSpotify::Artist.search(@setlist.artist)
    @artist = artist_search.first
    @albums = @artist.albums(limit: 50, country: current_user.market)
    # @setlist.tracks.nil? ? @tracks = [] : @tracks = @setlist.tracks
  end

  def create
    respond_to do |format|
      # track = JSON.parse(track_params[:track])
      x = Track.new(track_params)
      x.save
      # format.html { redirect_to setlist_path(@setlist, @user), method: :put, notice: 'Set was successfully edited.' }
      # format.html
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_setlist
    @setlist = Setlist.find(params[:setlist_id])
  end
  def set_user
    @user = User.find(params[:user_id])
  end
  def track_params
    params.require(:track).permit(:title, :artist, :user_id, :album, :setlist_id, :spotify_track_id)
  end
end
