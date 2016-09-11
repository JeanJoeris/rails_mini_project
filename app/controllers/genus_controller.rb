class GenusController < ApplicationController
  def show
    @genus = Genus.find(params[:id])
  end
end
