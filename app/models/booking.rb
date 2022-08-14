class Booking < ApplicationRecord
  belongs_to :cloth
  belongs_to :renter, class_name: "User"
  belongs_to :rentee, class_name: "User"
  has_one :review
end
