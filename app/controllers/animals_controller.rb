class AnimalsController < ApplicationController
  before_action :require_login

  def index
    @animal = Animal.all
  end

  def show
    @animal = Animal.find(params[:id])
    @wiki_img = "https://#{@animal.image_path}"
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    add_taxonomical_data(@animal)
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

  def add_taxonomical_data(animal)
    tax_data = WikiParser.get_taxonomical_data(animal.name)
    animal_pic = WikiParser.get_wiki_picture(animal.name)
    kingdom = Kingdom.find_or_create_by(name: tax_data["Kingdom"])
    phylum = Phylum.find_or_create_by(name: tax_data["Phylum"])
    taxonomical_class = TaxonomicalClass.find_or_create_by(name: tax_data["Class"])
    order = Order.find_or_create_by(name: tax_data["Order"])
    family = Family.find_or_create_by(name: tax_data["Family"])
    genus = Genus.find_or_create_by(name: tax_data["Genus"])
    species = Species.find_or_create_by(name: tax_data["Species"])
    animal.update(kingdom: kingdom,
                  phylum: phylum,
                  taxonomical_class: taxonomical_class,
                  order: order,
                  family: family,
                  genus: genus,
                  species: species,
                  image_path: animal_pic)
  end
end
