class PhylumsController < ApplicationController
  def show
    @phylum = Phylum.find(params[:id])
  end

  def index
    @phylums = Phylum.all
  end
end
