class Hospital < ActiveRecord::Base
  attr_accessible :prefecture_id,:name,:postcode,:address,:phone,:latitude,:longitude
  has_many :dpcs
  belongs_to :prefecture
  def ranking(disease_id, year)
    hospital_days = self.dpcs.where(year: year).first.hospital_days
    hospitals = Hospital.includes(:dpcs).where('dpcs.disease_id = ?', disease_id).where('dpcs.year = ?',year)
    pref_hospitals = Hospital.includes(:dpcs).where(prefecture_id: self.prefecture_id).where('dpcs.year = ?',year)

    all_ranking = hospitals.where('dpcs.hospital_days < ?', hospital_days).count + 1
    pref_ranking = pref_hospitals.where('dpcs.hospital_days < ?', hospital_days).count + 1
    return {all: all_ranking, pref: pref_ranking}

  end

end