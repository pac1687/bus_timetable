class Station < ActiveRecord::Base
  validates :name, :presence => true
  has_many :stops, :dependent => :destroy
  has_many :lines, through: :stops
end
