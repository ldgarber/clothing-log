class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :items
  has_many :outfits
  has_many :categories
  has_attached_file :fitpic, :styles => { :medium => "300x300", :thumb => "100x100>" }, attr_accessible: :fitpic
  validates_uniqueness_of :email
end
