class UserFavorite < ApplicationRecord
	belongs_to :user
	belongs_to :song
	belongs_to :album
end
