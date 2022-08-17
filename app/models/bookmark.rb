class Bookmark < ApplicationRecord
  belongs_to :cloth
  belongs_to :user
end
