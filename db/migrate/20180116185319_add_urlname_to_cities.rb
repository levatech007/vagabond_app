class AddUrlnameToCities < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :proper_name, :text
  end
end
