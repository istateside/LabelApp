module AlbumsHelper
  def default_band?(band)
    "selected" if @album.band == band
  end
end
