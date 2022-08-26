class ChangeLatitudeAndLongitudeToDecimal < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :latitude, :decimal, precision: 10, scale: 7
    change_column :posts, :longitude, :decimal, precision: 10, scale: 7
  end
end
