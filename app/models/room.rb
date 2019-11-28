class Room < ApplicationRecord
	has_one :booking
    has_one :user, through: :booking
    validates :num, presence: true, numericality: {larger_than: 0}, uniqueness: true
    validates :info, length: {maximum: 50}
end
