class Review < ApplicationRecord
  belongs_to :booking

  validates :comments, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true, in: (0..5)}
end
