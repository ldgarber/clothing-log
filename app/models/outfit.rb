class Outfit < ApplicationRecord
  validates :date, presence: true
  has_many :outfit_items
  has_many :items, through: :outfit_items
  accepts_nested_attributes_for :items
  
  def display_date
    self.date.strftime('%A, %B %d, %Y') 
  end
end
