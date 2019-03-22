class Album < ApplicationRecord
	validates :name,presence: true
	has_many :user_favorites
	has_many :songs
	belongs_to :artist
end
