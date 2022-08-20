class Cloth < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many_attached :photos
  validates :title, :description, :price, :category, :size, :color, :photos, :start_date, :end_date, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: [ :title, :description, :category, :brand, :color ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
