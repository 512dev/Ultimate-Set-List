class SetlistsController < ApplicationController
  before_action :set_setlist, only: [:show, :edit, :update, :destory]
  def new
    @setlist = Setlist.new
    # authorize @setlist

    # artist_search = RSpotify::Artist.search('Black Sabbath')
    # artist = artist_search.first
    # @albums = artist.albums(limit: 50, country: current_user.market)
  end

  def create
    @setlist = Setlist.new(setlist_params)
    # authorize @setlist

    respond_to do |format|
      if @setlist.save
        format.html { redirect_to setlist_path(@setlist, @user), notice: 'Set was successfully created.' }
        format.json { render :show, status: :created, location: @setlist }
      else
        format.html { render :new }
        # format.html { redirect_to new_setlist_path}
        format.json { render json: @setlist.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    # authorize @setlist
    # artist_search = RSpotify::Artist.search(@setlist.artist)
    # artist = artist_search.first
    # @albums = artist.albums(limit: 50, country: current_user.market)
  end
  def update
    print "The set list contains: #{params[:tracks]}"
    respond_to do |format|
      @setlist.update(setlist_params)
      format.html { redirect_to setlist_path(@setlist, @user), notice: 'Set was successfully edited.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_setlist
    @setlist = Setlist.find(params[:id])
  end

  def setlist_params
    params.require(:setlist).permit(:name, :artist, :user_id, :tracks)
  end
end
