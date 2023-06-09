class Api::V1::AdminWorkingHoursController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin_role
  before_action :set_working_hour, only: [:create, :update, :destroy]

  def create
    @working_hour = WorkingHour.new(working_hour_params)
    if @working_hour.save
      render json: @working_hour, status: :created
    else
      render json: @working_hour.errors, status: :unprocessable_entity
    end
  end

  def update
    if @working_hour.update(working_hour_params)
      render json: @working_hour
    else
      render json: @working_hour.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @working_hour.destroy
    head :no_content
  end

  private

  def set_working_hour
    @working_hour = WorkingHour.find(params[:id])
  end

  def working_hour_params
    params.require(:working_hour).permit(:day, :start_time, :end_time)
  end

  def check_admin_role
    unless current_user.admin?
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
