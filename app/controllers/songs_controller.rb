class SongsController < ApplicationController
  before_action :load_song, :load_playlist, :load_playlists, :load_comments, only: :show
  before_action :load_songs, only: :index
  def index
  end

  def new
    @song = Song.new
  end

  def create
    byebug
    check_song
  end

  def show
    @comment = Comment.new
  end

  private

  def check_song 
    @song = Song.new
    @artist_to_check = Artist.find_by name: params[:artist]
    if @artist_to_check.nil?
      @new_artist = Artist.create name: params[:artist], approved: false
      @song = @new_artist.songs.build url: params[:song][:url], title: params[:name], user_id: current_user.id, picture: params[:song][:picture], album_id: 3
    else
      @song = @artist_to_check.songs.build url: params[:song][:url], title: params[:name], user_id: current_user.id, picture: params[:song][:picture], album_id: 3
    end
    @genre = Genre.find_by id: params[:song][:genres]
    @song.genres << @genre
    if @song.save
      respond_to do |f|
        f.js {render js: "$.notify('uploaded music successfully, waiting for admin to approve','success');
                          $('#new_song').trigger('reset');"}
      end
    else
      respond_to do |f|
        f.js {render js: "$.notify('cannot upload music','error');
                          $('#new_song').trigger('reset');"}
      end
    end
  end

  def load_song
    @song = Song.find_by id: params[:id]
  end

  def load_songs
    @songs = Song.all.page params[:page]
  end

  def load_playlist
    @playlist = PlayList.new
  end

  def load_playlists
    @playlists = current_user ? current_user.play_lists : nil
  end

  def load_comments
    @comments = @song.comments.newest.page params[:page]
  end

  def load_album_songs
    @album_songs = @song.album.songs
  end

  def song_params
    params.require(:song).permit(:title, :picture, :song, :artist)
  end
end
