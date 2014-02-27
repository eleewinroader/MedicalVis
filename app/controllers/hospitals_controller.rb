# coding: utf-8
class HospitalsController < ApplicationController
  def show
    @disease = Disease.find(params[:disease_id])
    @hospital = Hospital.find(params[:id])
    @prefecture = @hospital.prefecture
    @chart_data = @hospital.dpcs.order(:year).map{|d| [d.year.to_s,d.hospital_days,d.patient_count]}.unshift(['','平均在院日数','患者数'])
  end
end
