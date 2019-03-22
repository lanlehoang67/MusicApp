class User < ApplicationRecord
	validates :full_name,presence: true, length: {maximum: 50}
	validates :email,presence: true, length: {maximum: 255}
	validates :gender,presence: true
	has_many :user_favorites
end
