class CreateClass < ActiveRecord::Migration[5.0]
  def change
    create_table :taxonomical_classes do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
