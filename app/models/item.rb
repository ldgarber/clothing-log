class Item < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :outfit_items
  has_many :outfits, through: :outfit_items, dependent: :destroy
  has_many :item_categories
  has_many :categories, through: :item_categories, dependent: :destroy
  accepts_nested_attributes_for :categories

  def price=(price_input)
    write_attribute :price, currency_to_number(price_input)
  end

  def long_name
    self.name
  end

  def worn_count
    self.outfits.length
  end

  def cost_per_wear
    if (self.worn_count == nil or self.worn_count == 0)
      if (self.price == nil)
        return 0
      else
        return self.price
      end
    else
      if (self.price == nil)
        return 0 
      else
        return self.price / self.worn_count
      end
    end
  end

  def self.most_worn(num)
    Item.all.sort_by(&:worn_count).reverse.take(num)
  end

  def self.least_worn(num) 
    Item.all.sort_by(&:worn_count).take(num)
  end

  def self.never_worn(num)
    never_worn = []
    Item.all.each do |item| 
      never_worn << item if item.worn_count == 0
    end
    return never_worn.take(num)
  end

  def self.lowest_cost_per_wear(num)
    Item.all.sort_by(&:cost_per_wear).take(num)
  end

  def self.highest_cost_per_wear(num)
    Item.all.sort_by(&:cost_per_wear).reverse.take(num)
  end

  def currency_to_number(currency_value)
    (currency_value.is_a? String) ? currency_value.scan(/[.0-9]/).join.to_d : currency_value
  end
end
