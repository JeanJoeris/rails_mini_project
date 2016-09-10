class Animal < ActiveRecord::Base
  validates :name, presence: true
  validates :legs, presence: true

  has_many :sightings
end
