class AnimalsController < ApplicationController
  before_action :require_login

  def index
    @animal = Animal.all
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to @animal
    else
      flash.now[:error] = @animal.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    @animal.update(animal_params)
    redirect_to @animal
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
    redirect_to animals_path
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :legs, :poisonous, :warm_blooded, :image_path)
  end

  def require_login
    flash[:authorization_error] = "You must log in to add an animal"
    redirect_to login_path unless logged_in?
  end
end
