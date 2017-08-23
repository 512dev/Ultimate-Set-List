class TracksController < ApplicationController
  before_action :set_setlist, only: [:index, :create, :destroy]
  before_action :set_user, only: [:create]
  def index
    @tracks = @setlist.tracks
    artist_search = RSpotify::Artist.search(@setlist.artist)
    @artist = artist_search.first
    @albums = @artist.albums(limit: 20, country: current_user.country, album_type: 'album,single')
    # @setlist.tracks.nil? ? @tracks = [] : @tracks = @setlist.tracks
  end

  def create
    respond_to do |format|
      x = Track.new(track_params)
      x.save
      format.js
    end
  end
  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    p "The Setlist is #{@setlist.id}"
    respond_to do |format|
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
    params.require(:track).permit(:title, :artist, :user_id, :album, :setlist_id, :spotify_track_id, :uri, :id)
  end
end
