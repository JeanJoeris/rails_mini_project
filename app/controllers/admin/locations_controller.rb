class Admin::LocationsController < Admin::BaseController
  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to admin_locations_path
    else
      flash.now[:error] = @location.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def location_params
    params.require(:location).permit(:name)
  end
end
