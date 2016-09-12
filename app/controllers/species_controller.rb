class SpeciesController < ApplicationController
  def show
    @species = Species.find(params[:id])
  end

  def index
    @species = Species.all
  end
end
