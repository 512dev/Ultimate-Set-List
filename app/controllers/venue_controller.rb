class VenueController < ApplicationController
  def new
    @venue = Venue.new
  end
  def create
    # TODO: search for venues
    # TODO: add venue to database if it doesn't exist
  end

  def index
  	@search = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_SECRET'])
  end

  def show

  end

  def destroy
  end

  def update
  end
end
