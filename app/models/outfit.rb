class Outfit < ApplicationRecord
  has_many :items, through: :outfit_items
end
