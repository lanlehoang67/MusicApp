class Song < ApplicationRecord
  attr_accessor :url
  attr_accessor :picture
  def artist_name
    return self.artist.name
  end

  def album_name
    return self.album.name
  end
	has_many :user_favorites, foreign_key: "favorite_id"
  has_many :song_genres
	has_many :genres, through: :song_genres
  has_many :comments
  has_many :history_songs
  has_many :users, through: :history_songs
	belongs_to :artist
  belongs_to :user
  belongs_to :play_list, optional: true
  belongs_to :album
  delegate :name, to: :artist, prefix: true
  scope :top, ->{where("songs.approved=true").order(views: :desc).limit(10)}
  scope :recent, ->{where("songs.approved=true").order(created_at: :desc).limit(10)}
  scope :find_by_genre, ->(genre_to_find){joins(:genres).where("genres.title = ? and songs.approved=true",genre_to_find) }
  scope :find_by_country, ->(country_to_find){where("songs.country = ? and songs.approved=true",country_to_find)}
  scope :trending, ->{where("songs.approved=true").order(views: :desc).limit(10)}
  has_attached_file :picture, validate_media_type: false
  has_attached_file :url, validate_media_type: false
  do_not_validate_attachment_file_type :picture
  do_not_validate_attachment_file_type :url
  def check_admin
    return self.approved = true if self.user.role == "admin"
  end
end
