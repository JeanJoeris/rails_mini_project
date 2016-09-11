class PhylumsController < ApplicationController
  def show
    @phylum = Phylum.find(params[:id])
  end
end
