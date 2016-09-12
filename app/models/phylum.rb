class Phylum < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :animals
  has_many :taxonomical_classes, through: :animals
  has_many :orders, through: :animals
  has_many :families, through: :animals
  has_many :genus, through: :animals
  has_many :species, through: :animals
end
