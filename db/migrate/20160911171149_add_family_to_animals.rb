class AddFamilyToAnimals < ActiveRecord::Migration[5.0]
  def change
    add_reference :animals, :family, index: true, foreign_key: true
  end
end
