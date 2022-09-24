class StringValue < ApplicationRecord
  has_many :feature_values, as: :valuable

  validates_uniqueness_of :value
end
