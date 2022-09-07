class ProductFeatureValue < ApplicationRecord
  belongs_to :product
  belongs_to :feature_value

  has_many :features, through: :feature_value
end
