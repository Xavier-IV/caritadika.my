class State < ApplicationRecord
  has_many :cities, dependent: :destroy
end
