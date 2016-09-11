class CreatePhylum < ActiveRecord::Migration[5.0]
  def change
    create_table :phylums do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
