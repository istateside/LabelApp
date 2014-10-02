class AlbumsController < ApplicationController
  def show
    @album = Album.find(params[:id])
    render :show
  end

  def new
    @band = Band.find(params[:band_id])
    @album = @band.albums.new
    render :new
  end

  def create
    @band = Band.find(album_params[:band_id])
    @album = @band.albums.new(album_params)
    if @album.save
      flash[:notice] = "Album saved!"
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @band = Band.find(params[:band_id])
    @album = band.albums.find(params[:id])
    render :new
  end

  def update
    if @album.update(album_params)
      redirect_to band_url(@album.band)
    else
      flash.new[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def destroy
  end

  private
  def album_params
    params.require(:album).permit(:name, :band_id, :live)
  end
end
