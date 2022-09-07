class IntegerValue < ApplicationRecord
  validates_uniqueness_of :value
end
