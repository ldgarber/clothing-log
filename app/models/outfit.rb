class Outfit < ApplicationRecord
  validates :date, presence: true
  has_many :outfit_items
  has_many :items, through: :outfit_items
  accepts_nested_attributes_for :items
  has_attached_file :fitpic, styles: { medium: "400", thumb: "150" }, default_url: "/images/:style/missing.png" 
  validates_attachment_content_type :fitpic, content_type: /\Aimage\/.*\z/

  def display_date
    self.date.strftime('%A, %B %d, %Y') 
  end

  def self.public
    where("private = ?", false) 
  end

  def self.private
    where("private = ?", true)
  end
end
