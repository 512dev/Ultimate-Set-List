class SetlistsController < ApplicationController
  before_action :set_setlist, only: [:show, :edit, :update, :destroy]
  def new
    @setlist = Setlist.new
    # authorize @setlist

    # artist_search = RSpotify::Artist.search('Black Sabbath')
    # artist = artist_search.first
    # @albums = artist.albums(limit: 50, country: current_user.market)
  end
  def index
    @user = current_user

  end

  def create
    artist_search = RSpotify::Artist.search(setlist_params[:artist])
    artist = artist_search.first
    image = artist.images[0]["url"]
    @setlist = Setlist.new(setlist_params)
    # authorize @setlist
    @setlist.artist_photo = image

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
    artist_search = RSpotify::Artist.search(@setlist.artist)
    @artist = artist_search.first
    @tracks = @setlist.tracks
    # @albums = artist.albums(limit: 50, country: current_user.market)
  end
  def update
    print "The set list contains: #{params[:tracks]}"
    respond_to do |format|
      @setlist.update(setlist_params)
      format.html { redirect_to setlist_path(@setlist, @user), notice: 'Set was successfully edited.' }
    end
  end
  def destroy
    
    @setlist.destroy
    respond_to do |format|
      format.html {redirect_to setlists_path(@user)}
    end
  end
  def generate_playlist
    setlist = Setlist.find(params[:setlist_id])
    # spotify_user_hash = current_user.to_hash
    p current_user.attributes
    spotify_user = RSpotify::User.new(current_user.attributes)
    p spotify_user
    list = spotify_user.create_playlist!(setlist.name, public: true)
    tracks = []
    setlist.tracks.each do |track|
      tracks << track.spotify_track_id
    end
    list.add_tracks!(tracks)
    respond_to do |format|
      format.html { redirect_to setlist_path(@setlist, @user), notice: 'Playlist successfully created!.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_setlist
    @setlist = Setlist.find(params[:id])
  end

  def setlist_params
    params.require(:setlist).permit(:name, :artist, :user_id, :tracks, :artist_photo, :setlist_id)
  end
end
