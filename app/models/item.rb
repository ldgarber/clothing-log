class Item < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :outfit_items
  has_many :outfits, through: :outfit_items
  has_many :item_categories
  has_many :categories, through: :item_categories
  accepts_nested_attributes_for :categories

  def long_name
    long_name = ""
    long_name << "#{self.brand} " if self.brand != nil
    long_name << "#{self.color} " if self.color != nil
    long_name << self.name
    return long_name.split(" ").map{|word| word.capitalize}.join(" ")
  end
end
