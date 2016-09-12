class AnimalsController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :allow_only_admins, only: [:destroy]

  def index
    @animal = Animal.alpha_sorted
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
      flash[:notice] = "Animal Created!"
      add_taxonomical_data(@animal)
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
    if @animal.no_taxonomical_data?
      add_taxonomical_data(@animal)
    end
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
    unless logged_in?
      flash[:authorization_error] = "You must log in to add an animal"
      redirect_to login_path
    end
  end

  def allow_only_admins
    unless current_admin?
      flash[:authorization_error] = "You aren't authorized to destroy animals, you monster..."
      redirect_to animals_path
    end
  end

  def add_taxonomical_data(animal)
    animal.add_taxonomical_data
    if animal.image_path.strip == ""
      animal_pic = WikiParser.get_wiki_picture(animal.name)
      animal.update(image_path: animal_pic)
    end
  end
end
