class SongGenre < ApplicationRecord
	belongs_to :song
	belongs_to :genres
end
