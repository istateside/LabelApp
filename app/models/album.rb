# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  band_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  live       :boolean          not null
#
# Indexes
#
#  index_albums_on_name  (name) UNIQUE
#

class Album < ActiveRecord::Base
  validates :name, :band_id, presence: true
  validates :live, :inclusion => {:in => [true, false]}

  has_many :tracks, :inverse_of => :album, dependent: :destroy
  belongs_to :band, :inverse_of => :albums
end
