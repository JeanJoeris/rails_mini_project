class Sighting < ApplicationRecord
  belongs_to :animal
  belongs_to :location

  validates :sighting_time, presence: true
end
