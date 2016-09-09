class AddColumnImagePathToAnimal < ActiveRecord::Migration[5.0]
  def change
    add_column :animals, :image_path, :string
  end
end
