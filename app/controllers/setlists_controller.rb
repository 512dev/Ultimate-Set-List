class SetlistsController < ApplicationController
  before_action :set_setlist, only: [:show, :edit, :update, :destory]
  def new
    @setlist = Setlist.new
    authorize @setlist
    @artist_search = RSpotify::Artist.search('Black', limit: 10)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_setlist
    @setlist = Setlist.find(params[:id])
  end
  def setlist_params
      params.require(:setlist).permit(:name)
    end

end
