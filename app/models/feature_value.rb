class FeatureValue < ApplicationRecord
  belongs_to :feature
  belongs_to :valuable, polymorphic: true
end
