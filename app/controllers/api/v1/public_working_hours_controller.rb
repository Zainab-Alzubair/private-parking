class Api::V1::PublicWorkingHoursController < ApplicationController
  def index
    @working_hours = WorkingHour.all
    render json: @working_hours
  end

  def show
    @working_hour = WorkingHour.find(params[:id])
    render json: @working_hour
  end
end
