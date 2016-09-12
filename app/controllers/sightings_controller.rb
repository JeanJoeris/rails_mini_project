class SightingsController < ApplicationController
  before_action :require_login, expect: [:show, :index]
  before_action :allow_only_creator, only: [:edit, :update, :destroy]

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

  def edit
    @sighting = Sighting.find(params[:id])
    @animals = Animal.all.order(name: :asc)
    @locations = Location.all.order(name: :asc)
  end

  def update
    @sighting = Sighting.find(params[:id])
    if @sighting.update(sighting_params)
      redirect_to @sighting
    else
      flash.now[:error] = @sighting.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @sighting = Sighting.find(params[:id])
  end

  def destroy
    Sighting.find(params[:id]).destroy
    redirect_to sightings_path
  end

  private

  def sighting_params
    params.require(:sighting).permit(:animal_id, :location_id, :sighting_time, :non_sighting)
  end

  def require_login
    unless logged_in?
      flash[:authorization_error] = "You must log in to add a sighting"
      redirect_to login_path
    end
  end

  def allow_only_creator
    unless creator?(Sighting.find(params[:id]).user)
      flash[:authorization_error] = "You can't change something you didn't create..."
      redirect_to sightings_path
    end
  end
end
