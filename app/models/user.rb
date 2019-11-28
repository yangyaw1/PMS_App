class User < ApplicationRecord
    has_one :booking, :dependent => :destroy 
    has_one :room, through: :booking
	before_save {self.email = email.downcase}
    validates(:name, presence: true, length: {maximum: 50})
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates(:email,
            format: {with: VALID_EMAIL_REGEX},
            presence: true,
            length: {maximum: 50},
            uniqueness: {case_sensitive: false})
    has_secure_password
    validates(:password,
            presence: true,
            length: {minimum: 6})
end
