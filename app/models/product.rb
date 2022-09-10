class Product < ApplicationRecord
  has_many :comments, as: :commentable

  has_many :category_products
  has_many :categories, through: :category_products

  has_many :product_feature_values
  has_many :feature_values, through: :product_feature_values
  has_many :features, through: :feature_values

  validates_presence_of :title
end
