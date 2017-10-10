class Item < ApplicationRecord
  validates :name, presence: true
  has_many :outfits, through: :outfit_items
  has_many :categories, through: :item_categories
end
