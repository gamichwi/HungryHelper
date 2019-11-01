class CreateFavourites < ActiveRecord::Migration[6.0]
  def change
    create_table :favourites do |t|
      t.string :restaurant_name
      t.string :restaurant_address
      t.string :restaurant_rating
      t.string :restaurant_directions
      t.string :restaurant_place_id
      t.string :photo_reference

      t.timestamps
    end
  end
end
