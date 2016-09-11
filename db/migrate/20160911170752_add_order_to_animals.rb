class AddOrderToAnimals < ActiveRecord::Migration[5.0]
  def change
    add_reference :animals, :order, index: true, foreign_key: true
  end
end
