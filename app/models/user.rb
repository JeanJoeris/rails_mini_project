class User < ApplicationRecord
  has_secure_password
  has_many :sightings
  enum role: [:default, :admin]
end
