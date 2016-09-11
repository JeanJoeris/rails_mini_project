class Phylum < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :animals
end
