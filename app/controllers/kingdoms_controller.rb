class KingdomsController < ApplicationController
  def show
    @kingdom = Kingdom.find(params[:id])
  end

  def index
    @kingdoms = Kingdom.all
  end
end
