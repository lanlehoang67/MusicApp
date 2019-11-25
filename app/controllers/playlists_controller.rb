class PlaylistsController < ApplicationController
  before_action :authenticate_user!, :load_playlists
  before_action :load_playlist, :load_songs, only: :show
  def index
  end

  def show
  end

  def post_song
    if request.xhr?
      session[:url] = params[:url]
    end
  end

  def get_songs
    @playlist = PlayList.find_by id: session[:url]
    respond_to do |f|
      f.json {render json:  @playlist.songs, methods: [:url, :picture, :artist_name, :album_name]}
    end
  end

  def create
  	@playlist = PlayList.new user_id: current_user.id, name: params[:play_list][:name]
    if @playlist.save
      respond_to do |f|
        f.js {render action: "create"}
      end
    end
  end

  def destroy
  end

  private

  def load_playlist
    @playlist = PlayList.find_by id: params[:id]
    return if @playlist
    render json: "cannot find playlist with id" + params[:id]
  end

  def load_songs
    @songs = @playlist.songs
  end

  def load_playlists
  	@playlists = current_user.play_lists
  end

end
