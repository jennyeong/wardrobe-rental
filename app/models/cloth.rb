class Cloth < ApplicationRecord
  validates :title, :description, :category, :color, :brand, :start_date, :end_date, presence: true
end
