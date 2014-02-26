class DiseasesController < ApplicationController
  def index
  end
  def show
    @disease = Disease.find(params[:id])
  end
end
