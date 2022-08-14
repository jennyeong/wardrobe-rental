class Review < ApplicationRecord
  belongs_to :booking

  validates :comments, presence: true
  validates :rating, presence: true
end
