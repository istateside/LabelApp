class TracksController < ApplicationController
  before_filter :check_log_in

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def new
    @album = Album.find(params[:album_id])
    @track = @album.tracks.new
    render :new
  end

  def create
    @album = Album.find(track_params[:album_id])
    @track = @album.tracks.new(track_params)
    if @track.save
      flash[:notice] = "Track saved to album!"
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
    @album = @track.album
    render :new
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      flash[:notice] = "Track updated!"
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def destroy
  end

  private
  def track_params
    params.require(:track).permit(:title, :album_id, :bonus, :lyrics)
  end
end
