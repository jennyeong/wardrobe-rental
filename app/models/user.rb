class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :cloths
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings, foreign_key: 'rentee_id'
  has_many :rented_cloths, through: :bookings, source: 'cloth'

  # def rented_cloths
  #   joins(:bookings).where(rentee_id: self)
  # end

end
