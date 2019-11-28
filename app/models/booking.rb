class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :user_id, presence: true, uniqueness: true
  validates :room_id, presence: true, uniqueness: true
end
