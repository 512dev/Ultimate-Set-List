class SetListTrackController < ApplicationController
  before_action :set_setlist, only: [:create]
  before_action :set_user, only: [:create]

  def create
    setlist = Setlist.find(track_params[:setlist_id])
    respond_to do |format|
      # track = JSON.parse(track_params[:track])
      x = Track.new(track_params)
      setlist.tracks << x
      x.save
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
    params.require(:track).permit(:title, :artist, :user_id, :album, :setlist_id, :spotify_track_id, :uri)
  end
end
