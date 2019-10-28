class Distance < ActiveRecord::Base
  validates :origin, length: { minimum: 1 }
  validates :destination, length: { minimum: 1 }
  validates :kilometers, numericality: { greater_than: 0 }
  validates :kilometers, numericality: { less_than_or_equal_to: 100000 }
end
