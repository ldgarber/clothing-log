class Outfit < ApplicationRecord
  has_many :outfit_items
  has_many :items, through: :outfit_items
  accepts_nested_attributes_for :items
end
