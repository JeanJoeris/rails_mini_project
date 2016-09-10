class CreateSighting < ActiveRecord::Migration[5.0]
  def change
    create_table :sightings do |t|
      t.references :animal, index: true, foreign_key: true
      t.references :location, index: true, foreign_key: true
      t.datetime :sighting_time
      t.timestamps null: false
    end
  end
end
