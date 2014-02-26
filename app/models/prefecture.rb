class Prefecture < ActiveRecord::Base
  attr_accessible :region_id, :name, :latitude, :longitude
  belongs_to :region
  has_many :hospitals
end
