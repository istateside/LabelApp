# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  album_id   :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  bonus      :boolean          not null
#  lyrics     :text
#

class Track < ActiveRecord::Base
  validates :title, :album_id, presence: true
  validates :bonus, :inclusion => {:in => [true, false]}


  belongs_to :album, :inverse_of => :tracks, dependent: :destroy
end
