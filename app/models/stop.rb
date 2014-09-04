class Stop < ActiveRecord::Base
  validates :station_id, numericality: true
  validates :line_id, numericality: true
  belongs_to :station
  belongs_to :line
end
