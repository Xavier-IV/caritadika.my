class Kindergarten < ApplicationRecord
  before_create :generate_nano_id

  # Use geocoder to handle latitude and longitude
  geocoded_by :coordinates  # Tells geocoder to use the `latitude` and `longitude` fields

  # Optional: you can also set reverse geocoding if you need
  reverse_geocoded_by :latitude, :longitude

  scope :filter_by_name, ->(name) { where("name ILIKE ?", "%#{name}%") if name.present? }
  scope :filter_by_state, ->(state) { where(state: state) if state.present? && state != "All States" }
  scope :filter_by_city, ->(city) { where(city: city) if city.present? && city != "All Cities" }
  scope :filter_by_business_type, ->(type) { where(business_type: type) if type.present? && type != "All" }
  scope :filter_by_business_category, ->(category) { where(business_category: category) if category.present? && category != "All" }


  private

  def generate_nano_id
    self.id = Nanoid.generate(size: 21) # Adjust the size as needed
  end
end
