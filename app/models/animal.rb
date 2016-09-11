class Animal < ActiveRecord::Base
  validates :name, presence: true
  validates :legs, presence: true

  has_many :sightings

  belongs_to :kingdom, optional: true
  belongs_to :phylum, optional: true
  belongs_to :taxonomical_class, optional: true
  belongs_to :order, optional: true
  belongs_to :family, optional: true
  belongs_to :genus, optional: true
  belongs_to :species, optional: true

  def no_taxonomical_data?
    !kingdom || !phylum || !taxonomical_class || !order || !family || !genus || !species
  end
end
