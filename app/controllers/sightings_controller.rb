class SightingsController < ApplicationController
  def index
    @sightings = Sighting.all
  end

  def new
    @sighting = Sighting.new
  end
end
