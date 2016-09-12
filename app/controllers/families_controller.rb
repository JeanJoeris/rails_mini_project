class FamiliesController < ApplicationController
  def show
    @family = Family.find(params[:id])
  end

  def index
    @families = Family.all
  end
end
