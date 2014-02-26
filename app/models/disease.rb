class Disease < ActiveRecord::Base
  attr_accessible :name
  has_many :dpcs
end
