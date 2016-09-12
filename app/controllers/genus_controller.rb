class GenusController < ApplicationController
  def show
    @genus = Genus.find(params[:id])
  end

  def index
    @genus = Genus.all
  end
end
