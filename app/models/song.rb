class Song < ApplicationRecord
	has_many :user_favorites
	has_many :song_genres
	has_many :lyrics
	belongs_to :artist
end
