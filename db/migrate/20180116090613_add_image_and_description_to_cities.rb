class AddImageAndDescriptionToCities < ActiveRecord::Migration[5.1]
  def change
  	add_column :cities, :image, :text
  	add_column :cities, :description, :string
  end
end
