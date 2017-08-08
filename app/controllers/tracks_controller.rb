class TracksController < ApplicationController
  def index
    @tracks = RSpotify::Track.search(params[:search])
      skip_policy_scope
      respond_to do |format|
      	 # format.html { render "setlist/track", notice: 'Set was successfully created.' }
         # format.json { render :, status: :created, location: @setlist }
         format.js
      end

  end
end
