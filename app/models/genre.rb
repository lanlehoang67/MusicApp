class Genre < ApplicationRecord
	validates :title,presence: true
	has_many :song_genre
end
