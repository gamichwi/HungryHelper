class Autocompletes < ActiveRecord::Migration[6.0]
  def change
    add_column :autocompletes, :latitude, :decimal
    add_column :autocompletes, :longtitude, :decimal
  end
end
