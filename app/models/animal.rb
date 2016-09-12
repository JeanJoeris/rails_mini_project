class Animal < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :legs, presence: true

  has_many :sightings

  belongs_to :kingdom, optional: true
  belongs_to :phylum, optional: true
  belongs_to :taxonomical_class, optional: true
  belongs_to :order, optional: true
  belongs_to :family, optional: true
  belongs_to :genus, optional: true
  belongs_to :species, optional: true

  def self.alpha_sorted
    all.order(name: :asc)
  end

  def no_taxonomical_data?
    !kingdom || !phylum || !taxonomical_class || !order || !family || !genus || !species
  end

  def add_taxonomical_data
    tax_data = WikiParser.get_taxonomical_data(name)

    kingdom = Kingdom.find_or_create_by(name: tax_data["Kingdom"])
    phylum = Phylum.find_or_create_by(name: tax_data["Phylum"])
    taxonomical_class = TaxonomicalClass.find_or_create_by(name: tax_data["Class"])
    order = Order.find_or_create_by(name: tax_data["Order"])
    family = Family.find_or_create_by(name: tax_data["Family"])
    genus = Genus.find_or_create_by(name: tax_data["Genus"])
    species = Species.find_or_create_by(name: tax_data["Species"])

    update(kingdom: kingdom,
           phylum: phylum,
           taxonomical_class: taxonomical_class,
           order: order,
           family: family,
           genus: genus,
           species: species)
  end

  def wiki_img_url
    "https://#{image_path}"
  end

  def sighting_number
    sightings.where(non_sighting: false).count
  end

  def non_sighting_number
    sightings.where(non_sighting: true).count
  end
end
