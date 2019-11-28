class Room < ApplicationRecord
    validates :num, presence: true, numericality: {larger_than: 0}
    validates :info, length: {maximum: 50}
end
