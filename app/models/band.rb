class Band < ActiveRecord::Base
  validates :name, presence: true

  has_many :albums, :inverse_of => :band

end