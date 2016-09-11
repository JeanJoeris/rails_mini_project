class AddKingdomToAnimals < ActiveRecord::Migration[5.0]
  def change
    add_reference :animals, :kingdom, index: true, foreign_key: true
  end
end
