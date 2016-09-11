class AddClassToAnimals < ActiveRecord::Migration[5.0]
  def change
    add_reference :animals, :taxonomical_class, index:true, foreign_key: true
  end
end
