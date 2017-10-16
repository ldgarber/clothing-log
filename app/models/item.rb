class Item < ApplicationRecord
  validates :name, presence: true
  has_many :outfit_items
  has_many :outfits, through: :outfit_items
  has_many :item_categories
  has_many :categories, through: :item_categories
  accepts_nested_attributes_for :item_categories
  accepts_nested_attributes_for :categories
end
