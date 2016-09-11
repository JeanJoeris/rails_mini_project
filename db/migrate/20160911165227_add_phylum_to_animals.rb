class AddPhylumToAnimals < ActiveRecord::Migration[5.0]
  def change
    add_reference :animals, :phylum, index: true, foreign_key: true
  end
end
