class KingdomsController < ApplicationController
  def show
    @kingdom = Kingdom.find(params[:id])
  end
end
