class ApplicationController < ActionController::Base
  # rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
  # rescue_from ::NameError, with: :error_occurred
  # rescue_from ::ActionController::RoutingError, with: :error_occurred
  # # rescue_from ::Exception, with: :error_occurred
  before_action :load_playlist, :load_recent_song, :load_trending_song, :load_events
  skip_before_action :verify_authenticity_token
  respond_to :html, :json, :js

  # protected
  def load_playlist
    @playlist = PlayList.find_by id: session[:url]
    return unless @playlist
    @pl_songs = @playlist.songs
    return @pl_songs
  end
  # def record_not_found(exception)
  #   render json: {error: exception.message}.to_json, status: 404
  #   return
  # end
  def render_404
    respond_to do |format|
      format.html { render layout: 'layouts/404', status: 404 }
    end
  end

  def load_recent_song
    @recent_songs = Song.recent
  end

  def load_trending_song
    @trending_songs = Song.trending
  end
  # def error_occurred(exception)
  #   render json: {error: exception.message}.to_json, status: 500
  #   return
  # end
  def load_events
    @events = Event.newest
    return unless @events
    @hot_events = []
    @normal_events = []
    @events.each do |e|
      if e.type_event == "hot"
        @hot_events << e
      else
        @normal_events << e
      end
    end
  end

  def search
    if request.xhr?
      @search_songs = Song.ransack(title_cont: params[:q]).result(distinct: true)
      @search_artists = Artist.ransack(name_cont: params[:q]).result(distinct: true)
      @search_albums = Album.ransack(name_cont: params[:q]).result(distinct: true)
      respond_to do |f|
        f.js {render :file => 'layouts/search'}
      end
    end
  end

end
