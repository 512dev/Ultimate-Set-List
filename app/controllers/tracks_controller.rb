class TracksController < ApplicationController
	before_action :set_setlist, only:[:index] 
  def index

    artist_search = RSpotify::Artist.search(@setlist.artist)
    artist = artist_search.first
    @albums = artist.albums(limit: 50, country: current_user.market)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_setlist
    @setlist = Setlist.find(params[:setlist_id])
  end
end
