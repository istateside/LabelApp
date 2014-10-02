# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_bands_on_name  (name) UNIQUE
#

class Band < ActiveRecord::Base
  validates :name, presence: true

  has_many :albums, :inverse_of => :band, dependent: :destroy
end
