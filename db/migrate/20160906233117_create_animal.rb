class CreateAnimal < ActiveRecord::Migration[5.0]
  def change
    create_table :animals do |t|
      t.string :name
      t.integer :legs
      t.boolean :poisonous
      t.boolean :warm_blooded
      t.timestamps null: false
    end
  end
end
