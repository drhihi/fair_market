class Feature < ApplicationRecord
  has_many :feature_values
  # has_many :valuables, through: :feature_values, source: :valuable, as: :valuable
  # has_many :valuables, through: :feature_values, source_type: 'StringValue', as: :valuable
  has_many :strs, through: :feature_values, source: :valuable, source_type: 'StringValue'
  has_many :ints, through: :feature_values, source: :valuable, source_type: 'IntegerValue'
end
