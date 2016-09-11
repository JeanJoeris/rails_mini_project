class AddSpeciesToAnimals < ActiveRecord::Migration[5.0]
  def change
    add_reference :animals, :species, index: true, foreign_key: true
  end
end
