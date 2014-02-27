class PrefecturesController < ApplicationController
  def show
    @disease = Disease.find(params[:disease_id])
    @prefecture = Prefecture.find(params[:id])
    @hospitals = @prefecture.hospitals#.includes(:dpcs).where('dpcs.year = ?',2012).order('dpcs.hospital_days ASC')
  end
end
