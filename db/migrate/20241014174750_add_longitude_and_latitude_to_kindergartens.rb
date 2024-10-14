class AddLongitudeAndLatitudeToKindergartens < ActiveRecord::Migration[7.2]
  def change
    add_column :kindergartens, :longitude, :decimal, precision: 10, scale: 6
    add_column :kindergartens, :latitude, :decimal, precision: 10, scale: 6
  end
end
