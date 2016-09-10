class CreateSighting < ActiveRecord::Migration[5.0]
  def change
    create_table :sightings do |t|
      t.references :animals, index: true, foreign_key: true
      t.references :locations, index: true, foreign_key: true
      t.datetime :sighting_time
      t.timestamps null: false
    end
  end
end
