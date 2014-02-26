class Hospital < ActiveRecord::Base
  attr_accessible :prefecture_id,:name,:postcode,:address,:phone,:latitude,:longitude
  has_many :dpcs
  belongs_to :prefecture
end