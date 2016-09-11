class ClassesController < ApplicationController
  def show
    @class = TaxonomicalClass.find(params[:id])
  end
end
