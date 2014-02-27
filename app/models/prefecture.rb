class Prefecture < ActiveRecord::Base
  attr_accessible :region_id, :name, :latitude, :longitude
  belongs_to :region
  has_many :hospitals

  def zoom_level
    l = [1]
    s = [8,19,10,11,12,13,1416,18,19,23,24,25,27,29,33,36,37,38,39,41,42,43]
    ss = [47]

    if l.include?(self.id)
      8
    elsif s.include?(self.id)
      10
    elsif ss.include?(self.id)
      10
    else
      9
    end
  end
end
