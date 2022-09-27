class Product < ApplicationRecord
  has_many :comments, as: :commentable

  has_many :category_products
  has_many :categories, through: :category_products

  has_many :product_feature_values
  has_many :feature_values, through: :product_feature_values
  has_many :features, through: :feature_values

  validates_presence_of :title
  validates :images,
            file_size: { less_than_or_equal_to: 100.kilobytes },
            file_content_type: { allow: ['image/jpeg', 'image/png'] },
            length: { maximum: 5 }

  has_many_attached :images do |attachable|
    attachable.variant :thumbnail, resize: '100x100'
    attachable.variant :large, resize: '250x250'
  end

end
