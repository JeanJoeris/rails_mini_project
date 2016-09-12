class Genus < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :animals
  has_many :species, through: :animals
end
