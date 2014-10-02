class Album < ActiveRecord::Base
  has_many :tracks, :inverse_of => :album
  belongs_to :band, :inverse_of => :albums
end