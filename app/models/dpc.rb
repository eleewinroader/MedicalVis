class Dpc < ActiveRecord::Base
  attr_accessible :disease_id, :hospital_id, :year, :hospital_days, :patient_count
  belongs_to :disease
  belongs_to :hospital
end
