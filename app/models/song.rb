class Song < ApplicationRecord
	has_many :user_favorites, foreign_key: "favorite_id"
  has_many :song_genres
	has_many :genres, through: :song_genres
	has_many :lyrics
  has_many :comments
	belongs_to :artist
  belongs_to :user
  belongs_to :play_list
  delegate :name, to: :artist, prefix: true
  scope :high_views, ->{all.order(views: :desc).limit(3)}
end
