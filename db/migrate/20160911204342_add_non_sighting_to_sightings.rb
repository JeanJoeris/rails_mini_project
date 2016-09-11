class AddNonSightingToSightings < ActiveRecord::Migration[5.0]
  def change
    add_column :sightings, :non_sighting, :boolean, default: false
  end
end
