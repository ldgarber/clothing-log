class Category < ApplicationRecord
  belongs_to :user
  has_many :item_categories
  has_many :items, through: :item_categories, dependent: :destroy
end
