class Feature < ApplicationRecord
  has_many :feature_values
  # has_many :valuables, through: :feature_values, source: :valuable, as: :valuable
  has_many :valuables, through: :feature_values, source_type: 'StringValue', as: :valuable
end
