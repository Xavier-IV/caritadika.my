class AddDetailedAddressToKindergartens < ActiveRecord::Migration[7.2]
  def change
    add_column :kindergartens, :address_line_1, :string
    add_column :kindergartens, :address_line_2, :string
    add_column :kindergartens, :postcode, :string
    add_column :kindergartens, :jkm_registration_no, :string
    add_column :kindergartens, :jkm_valid_from, :date
    add_column :kindergartens, :jkm_valid_to, :date
    add_column :kindergartens, :gps_coordinates, :string
    add_column :kindergartens, :google_maps_link, :string
  end
end
