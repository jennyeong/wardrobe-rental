class Cloth < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  validates :title, :description, :price, :category, :color, :brand, :start_date, :end_date, presence: true
end
