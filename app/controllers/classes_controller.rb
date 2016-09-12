class ClassesController < ApplicationController
  def show
    @class = TaxonomicalClass.find(params[:id])
  end

  def index
    @classes = TaxonomicalClass.all
  end
end
