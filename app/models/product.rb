class Product < ApplicationRecord
  validates_presence_of :title

  has_many :category_products
  has_many :categories, through: :category_products
end
