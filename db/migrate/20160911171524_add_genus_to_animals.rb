class AddGenusToAnimals < ActiveRecord::Migration[5.0]
  def change
    add_reference :animals, :genus, index: true, foreign_key: true
  end
end
