class StringValue < ApplicationRecord
  validates_uniqueness_of :value
end
