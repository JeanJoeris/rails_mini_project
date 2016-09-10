class Sighting < ApplicationRecord
  belongs_to :animal
  belongs_to :location
  belongs_to :user

  validates :sighting_time, presence: true
end
