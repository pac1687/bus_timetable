class Line < ActiveRecord::Base
  validates :name, :presence => true
  has_many :stops, :dependent => :destroy
  has_many :stations, through: :stops
end
