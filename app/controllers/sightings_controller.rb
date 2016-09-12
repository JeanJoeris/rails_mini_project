class SightingsController < ApplicationController
  def index
    @sightings = Sighting.all.order(sighting_time: :asc)
  end

  def new
    @sighting = current_user.sightings.new
    @animals = Animal.all.order(name: :asc)
    @locations = Location.all.order(name: :asc)
  end

  def create
    @sighting = current_user.sightings.new(sighting_params)
    if @sighting.save
      redirect_to @sighting
    else
      flash.now[:error] = @sighting.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @sighting = Sighting.find(params[:id])
  end

  private

  def sighting_params
    params.require(:sighting).permit(:animal_id, :location_id, :sighting_time, :non_sighting)
  end
end
