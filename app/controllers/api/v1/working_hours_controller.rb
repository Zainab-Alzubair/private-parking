class Api::V1::WorkingHoursController < ApplicationController
  protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }

  # GET /api/v1/working_hours
  def index
    @working_hours = WorkingHour.all
    render json: { working_hours: @working_hours }, status: :ok
  end

  # GET /api/v1/working_hours/:id
  def show
    @working_hour = WorkingHour.find(params[:id])
    render json: { working_hour: @working_hour }, status: :ok
  end

  # POST /api/v1/working_hours
  def create
    @working_hour = WorkingHour.new(working_hour_params)
    if @working_hour.save
      render json: { working_hour: @working_hour, message: 'Working hour created successfully' }, status: :created
    else
      render json: { errors: @working_hour.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH /api/v1/working_hours/:id
  def update
    @working_hour = WorkingHour.find(params[:id])
    if @working_hour.update(working_hour_params)
      render json: { working_hour: @working_hour, message: 'Working hour updated successfully' }, status: :ok
    else
      render json: { errors: @working_hour.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def working_hour_params
    params.require(:working_hour).permit(:day, :start_time, :end_time).tap do |wh_params|
      wh_params[:start_time] = Time.zone.parse(wh_params[:start_time])
      wh_params[:end_time] = Time.zone.parse(wh_params[:end_time])
    end
  end

  def check_admin_role
    unless current_user.admin?
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
