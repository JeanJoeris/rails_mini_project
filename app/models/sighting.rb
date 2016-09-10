class Sighting < ApplicationRecord
  belongs_to :animal
  belongs_to :location
end
